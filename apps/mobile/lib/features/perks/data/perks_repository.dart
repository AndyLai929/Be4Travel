import '../../../core/network/api_client.dart';
import '../domain/perk.dart';

class PerksRepository {
  final ApiClient _apiClient;

  PerksRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<Perk>> getAllPerks() async {
    final data = await _apiClient.get('/perks/') as List;
    return data.map((json) => Perk.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<List<Perk>> suggestPerks({
    required String airline,
    required String origin,
    required String destination,
    bool isTransfer = false,
    String bookingClass = 'economy',
  }) async {
    final data = await _apiClient.post('/perks/suggest', {
      'airline': airline,
      'origin': origin,
      'destination': destination,
      'is_transfer': isTransfer,
      'booking_class': bookingClass,
    });
    final perks = data['suggested_perks'] as List;
    return perks.map((json) => Perk.fromJson(json as Map<String, dynamic>)).toList();
  }
}
