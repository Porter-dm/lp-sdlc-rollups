# zebra-sdlc-rollups
The main 'big box' zebra integration repository.  It get's amended automatically via the SDLC process.

## Github Actions

### Integration Release - integration-release.yml
Create an Octopus release on the `Latest` channel for every main commit

### Nightly Release - nightly-release.yml
Create an Octopus release on the `Nightly` channel every night

### Tagged Release - tagged-release.yml
Create an Octopus release on the `Pre Release` or `Production` channels whenever the repo is tagged.  Tags that contain a pre-release suffix will go to `Pre Release`.


## soon to be retired
This also contains the Jenkins build pipeline, though the pipeline independently checks out the required version rather than using the chart that is local to it.  This is just to save us having 2 repos which would be confusing.

