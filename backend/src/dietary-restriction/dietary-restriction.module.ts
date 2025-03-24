import { Module } from '@nestjs/common';
import { DietaryRestrictionService } from './dietary-restriction.service';
import { DietaryRestrictionController } from './dietary-restriction.controller';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  imports: [DatabaseModule],
  controllers: [DietaryRestrictionController],
  providers: [DietaryRestrictionService],
})
export class DietaryRestrictionModule {}
