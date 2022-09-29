import 'dart:math';

import 'package:drpc/drpc.dart';

import '../../../project/entity/project.entity.dart';
import 'output/browse.project.router.output.dart';

const browseProjectRouterRoute = '/api/project/browse';

final browseProjectRouter = Router(
  request: createRouterRequest(
    route: browseProjectRouterRoute,
    outputFromJsonAsync: (json) async {
      return BrowseProjectRouterOutput.fromJson(json);
    },
  ),
  handler: (args) async {
    return BrowseProjectRouterOutput(
      projects: [
        ProjectEntity(
          id: cuid(),
          name: 'Make local guides',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Create a local grocery delivery service',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Start a virtual event planning company',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Sell zero-waste products',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Make products for pets',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Create custom clothing',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Sell vintage clothing online',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Begin niche blogging',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Become an e-book writer',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Start ghostwriting',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Offer virtual team-building',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Become a resume writer',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Open a coworking space',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Become an online coach',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Flip failing websites',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Become a web developer',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Start a podcast',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Be a social media influencer',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Create online courses',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Become a marketing consultant',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Develop an app',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Start a meal-prep business',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Make a smart appliance',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Tap into virtual reality experiences',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Make a niche dating site',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Develop a chatbot',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Offer matchmaking skills',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Be a virtual assistant',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Reinvent exercising',
        ),
        ProjectEntity(
          id: cuid(),
          name:
              'Create eco-friendly, health-friendly makeup and beauty products',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Open a food truck or restaurant pop-up',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Start an organization business',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Create a food waste solution',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Do interior design for young professionals',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Capitalize on plant-based foods',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Start a drop-shipping business',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Curate subscription boxes',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Create an airport-centric app',
        ),
        ProjectEntity(
          id: cuid(),
          name: 'Become a destination wedding planner',
        ),
      ]..sort((a, b) => Random().nextInt(3) - 1),
    );
  },
);
