using Firebase.Auth;
using System;
using System.Threading.Tasks;
using Xamarin.Forms;
using XamarinFirebaseDemo.Droid;

[assembly: Dependency(typeof(AuthAndroid))]
namespace XamarinFirebaseDemo.Droid
{
    public class AuthAndroid : IAuth
    {
        public async Task<bool> LoginWithEmailPassword(string email, string password)
        {
            try
            {
                var result = await FirebaseAuth.Instance.SignInWithEmailAndPasswordAsync(email, password);
                return result != null;
            }
            catch (FirebaseAuthException e)
            {
                Console.WriteLine($"Firebase error: {e.Message}");
                return false;
            }
            catch (Exception e)
            {
                Console.WriteLine($"Generic error: {e.Message}");
                return false;
            }
        }

        public async Task<bool> SignUpWithEmailPassword(string email, string password)
        {
            try
            {
                var result = await FirebaseAuth.Instance.CreateUserWithEmailAndPasswordAsync(email, password);

                return result != null;
            }
            catch (Exception e)
            {
                Console.WriteLine($"Generic error: {e.Message}");
                return false;
            }
        }
    }
}