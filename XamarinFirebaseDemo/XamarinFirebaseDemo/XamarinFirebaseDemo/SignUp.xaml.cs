using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace XamarinFirebaseDemo
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SignUp : ContentPage
    {
        IAuth auth;

        public SignUp()
        {
            InitializeComponent();
            auth = DependencyService.Get<IAuth>();
        }

        async void SignUpClicked(object sender, EventArgs e)
        {
            bool created = await auth.SignUpWithEmailPassword(EmailInput.Text, PasswordInput.Text);
            if (created)
            {
                await DisplayAlert("Success", "Welcome to our system. Log in to have full access", "OK");
                await Navigation.PopAsync();
            }
            else
            {
                await DisplayAlert("Sign Up Failed", "Something went wrong. Try again!", "OK");
            }
        }

        async void LogInClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new MainPage());
        }
    }
}