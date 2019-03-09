# Copyright 2018 Jonathan Campos
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM gcr.io/google_appengine/nodejs
MAINTAINER Jonathan Campos <jonbcampos@gmail.com>
RUN /usr/local/bin/install_node '>=0.12.7'
COPY . /app/
RUN npm install --unsafe-perm || \
    ((if [ -f npm-debug.log ]; then \
        cat npm-debug.log; \
    fi) && false)
CMD npm start