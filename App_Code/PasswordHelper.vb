Imports System.Security.Cryptography

Public Module PasswordHelper
    Public Function HashPassword(password As String) As String
        Dim salt(15) As Byte
        Using rng As New RNGCryptoServiceProvider()
            rng.GetBytes(salt)
        End Using
        Dim pbkdf2 As New Rfc2898DeriveBytes(password, salt, 100000)
        Dim hash As Byte() = pbkdf2.GetBytes(20)
        Dim hashBytes(35) As Byte
        Array.Copy(salt, 0, hashBytes, 0, 16)
        Array.Copy(hash, 0, hashBytes, 16, 20)
        Return Convert.ToBase64String(hashBytes)
    End Function

    Public Function VerifyPassword(password As String, storedHash As String) As Boolean
        Try
            Dim hashBytes As Byte() = Convert.FromBase64String(storedHash)
            If hashBytes.Length <> 36 Then Return password = storedHash
            Dim salt(15) As Byte
            Array.Copy(hashBytes, 0, salt, 0, 16)
            Dim pbkdf2 As New Rfc2898DeriveBytes(password, salt, 100000)
            Dim hash As Byte() = pbkdf2.GetBytes(20)
            For i As Integer = 0 To 19
                If hashBytes(i + 16) <> hash(i) Then Return False
            Next
            Return True
        Catch
            Return password = storedHash
        End Try
    End Function
End Module
