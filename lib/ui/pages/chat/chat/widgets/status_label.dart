
import 'package:flutter/material.dart';

enum Status { ONLINE, OFFLINE, AUSENTE }

class StatusLabel {
  final String label;
  final Color color;

  const StatusLabel(this.label, this.color);
}

StatusLabel getValuesByStatus(Status status) {
  switch (status) {
    case Status.ONLINE:
      return StatusLabel("Online", Color(0xFF68D391));
    case Status.AUSENTE:
      return StatusLabel("Ausente", Color(0xFFFAC301));
    case Status.OFFLINE:
      return StatusLabel("Offline", Color(0xFFD0D5DD));
  }
}