Subject: Re: Building meta-ti with ti-sgx-ddk-km for Yocto dunfell Kernel 5.4 fails
To: meta-ti@lists.yoctoproject.org
From: "Michael" <kakuschky@elbe-net.de>
X-Originating-Location: Hamburg, Free and Hanseatic City of Hamburg, DE (46.142.251.139)
X-Originating-Platform: Windows Firefox 90
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 Aug 2021 15:08:01 -0700
References: <QWlz.1628602755891666140.xanL@lists.yoctoproject.org>
In-Reply-To: <QWlz.1628602755891666140.xanL@lists.yoctoproject.org>
Message-ID: <16327.1628633281888859859@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="4VSg4LQxuepDycU1cUs1"

--4VSg4LQxuepDycU1cUs1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I found the solution by myself. the Kernel needs to be configured and build=
 with CONFIG_DRM_LEGACY option then ti-sgx-ddk-km will be build.

--4VSg4LQxuepDycU1cUs1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I found the solution by myself. the Kernel needs to be configured and build=
 with CONFIG_DRM_LEGACY option then ti-sgx-ddk-km will be build.

--4VSg4LQxuepDycU1cUs1--
