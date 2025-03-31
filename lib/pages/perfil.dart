import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // foto
            CircleAvatar(
            radius: 60,
            backgroundImage: const AssetImage('assets/images/profile_picture.jpg')
            ),
            const SizedBox(height: 20),
            // nome
            const Text(
              'Po',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // email
            const Text(
              'po.dragaoguerreiro@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // infos do perfil 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      ProfileInfoRow(
                        icon: Icons.chevron_right,
                        label: 'Idade',
                        value: '20 anos',
                      ),
                      Divider(),
                      ProfileInfoRow(
                        icon: Icons.phone,
                        label: 'Telefone',
                        value: '+55 11 98765-4321',
                      ),
                      Divider(),
                      ProfileInfoRow(
                        icon: Icons.location_on,
                        label: 'Endereço',
                        value: 'Vale da Paz, Palácio de Jade, China',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            ElevatedButton.icon(
              onPressed: () {
                //editar perfil em breve pop up
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Editar perfil em breve!')),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Editar Perfil'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color.fromARGB(255, 61, 61, 61)),
        const SizedBox(width: 10),
        Text(
          '$label:',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}