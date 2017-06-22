% Copyright (C) 2010-2017, Raytheon BBN Technologies and contributors listed
% in the AUTHORS file in TASBE analytics package distribution's top directory.
%
% This file is part of the TASBE analytics package, and is distributed
% under the terms of the GNU General Public License, with a linking
% exception, as described in the file LICENSE in the TASBE analytics
% package distribution's top directory.

function [ok ratios] = compare_color_models(CM1, CM2, tolerance)

fprintf('FITC->MEFL: %.3e %.3e\n',getK_MEFL(CM1.unit_translation),getK_MEFL(CM2.unit_translation));

for i=1:numel(CM1.Channels)
    fprintf('Channel %i: mean %.3e %.3e',i,getMean(CM1.autofluorescence_model{i}),getMean(CM2.autofluorescence_model{i}));
    fprintf('    std  %.3e %.3e\n',getStd(CM1.autofluorescence_model{i}),getStd(CM2.autofluorescence_model{i}));
end

fprintf('Compensation:\n');
disp(getCompensationMatrix(CM1.compensation_model));
disp(getCompensationMatrix(CM2.compensation_model));

fprintf('Translation Matrices:\n');
disp(getScales(CM1.color_translation_model));
disp(getScales(CM2.color_translation_model));


%         CM.unit_translation=[]  ;      % conversion of FITC channel to MEFL
%         CM.autofluorescence_model=[];  % array, one per channel, for removing autofluorescence
%         CM.compensation_model=[]     ; % For compensating for spectral overlap
%         CM.color_translation_model=[] ;% For converting and channel to FITC equiv
