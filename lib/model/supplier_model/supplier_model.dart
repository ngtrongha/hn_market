
import 'package:objectbox/objectbox.dart';

@Entity()
class SupplierModel {
  @Id()
  int uid;
  String? name; 
  String? address;
  String? phone; 
  SupplierModel(
      {this.uid = 0,
      this.name,
      this.address,
      this.phone,
       });
}
