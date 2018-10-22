using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    class Events : IMethod
    {
        public void Method()
        {
            Console.WriteLine("---Events");
            WeatherStation station = new WeatherStation("My weather station");
            station.WeatherChanged += RadioWeather;

            station.Temperature = 20.0;
            station.Temperature = 14.0;
        }

        public static void RadioWeather(object sender, WeatherEventArgs e)
        {
            Console.WriteLine("\tTemperature changed : " + (e.NewTemperature - e.OldTemperture) 
                + $" on {(sender as WeatherStation).Name}");
        }
    }

    class WeatherStation
    {
        private double temperature;
        public string Name { get; set; }
        public double Temperature
        {
            get => temperature;
            set
            {
                if (Math.Abs(value - temperature) < 0.001)
                    return;
                OnTemperatureChanged(new WeatherEventArgs(temperature, value));

                temperature = value;
            }
        }

        public WeatherStation(string name)
        {
            Name = name;
        }

        public event EventHandler<WeatherEventArgs> WeatherChanged;

        protected virtual void OnTemperatureChanged(WeatherEventArgs e)
        {
            WeatherChanged?.Invoke(this, e);
        }
    }

    class WeatherEventArgs : EventArgs
    {
        public readonly double OldTemperture, NewTemperature;

        public WeatherEventArgs(double oldTemperture, double newTemperature)
        {
            OldTemperture = oldTemperture;
            NewTemperature = newTemperature;
        }
    }
}
