import 'package:flutter/material.dart';
import '../domain/perk.dart';
import '../data/perks_repository.dart';
import '../../../core/network/api_client.dart';

class PerksScreen extends StatefulWidget {
  const PerksScreen({super.key});

  @override
  State<PerksScreen> createState() => _PerksScreenState();
}

class _PerksScreenState extends State<PerksScreen> {
  final _repository = PerksRepository(apiClient: ApiClient());
  List<Perk> _perks = [];
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPerks();
  }

  Future<void> _loadPerks() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final perks = await _repository.getAllPerks();
      setState(() {
        _perks = perks;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _suggestPerks() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final perks = await _repository.suggestPerks(
        airline: 'Singapore Airlines',
        origin: 'HKG',
        destination: 'LHR',
        isTransfer: true,
        bookingClass: 'business',
      );
      setState(() {
        _perks = perks;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Be4Travel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadPerks,
            tooltip: 'Reload all perks',
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _suggestPerks,
        icon: const Icon(Icons.flight_takeoff),
        label: const Text('Suggest Perks'),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: $_error', textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: _loadPerks, child: const Text('Retry')),
          ],
        ),
      );
    }
    if (_perks.isEmpty) {
      return const Center(child: Text('No perks available'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _perks.length,
      itemBuilder: (context, index) => _PerkCard(perk: _perks[index]),
    );
  }
}

class _PerkCard extends StatelessWidget {
  final Perk perk;
  const _PerkCard({required this.perk});

  IconData get _icon => switch (perk.category) {
        'miles' => Icons.stars,
        'stopover' => Icons.hotel,
        'voucher' => Icons.card_giftcard,
        _ => Icons.local_offer,
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(_icon, color: theme.colorScheme.primary),
        title: Text(perk.name),
        subtitle: Text(perk.description),
        trailing: Chip(
          label: Text(perk.eligible ? 'Eligible' : 'Not Eligible'),
          backgroundColor: perk.eligible
              ? Colors.green.withValues(alpha: 0.15)
              : Colors.grey.withValues(alpha: 0.15),
        ),
      ),
    );
  }
}
