Subject: Re: Building meta-ti with ti-sgx-ddk-km for Yocto dunfell Kernel 5.4 fails
To: meta-ti@lists.yoctoproject.org
From: "Michael" <kakuschky@elbe-net.de>
X-Originating-Location: DE (165.225.27.83)
X-Originating-Platform: Linux Firefox 90
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 11 Aug 2021 02:05:19 -0700
References: <20210810224852.GL1528@denix.org>
In-Reply-To: <20210810224852.GL1528@denix.org>
Message-ID: <28423.1628672719851174184@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="zfBFAZP5ueotmfK9Dfhs"

--zfBFAZP5ueotmfK9Dfhs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Denys, I tried with 5.4 and 5.10 both run in the same problem when no=
t set CONFIG_DRM_LEGACY=3Dy in custom defconfig. When open the original sou=
rce with

bitbake -c menuconfig virtual/kernel

the CONFIG_DRM_LEGACY option is unset.

git shows me the following branch

git describe --tags
dunfell-23.0.8-49-g43060f59ba

--zfBFAZP5ueotmfK9Dfhs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Denys, I tried with 5.4 and 5.10 both run in the same problem when no=
t set CONFIG_DRM_LEGACY=3Dy in custom defconfig. When open the original sou=
rce with <br /><br />bitbake -c menuconfig virtual/kernel<br /><br />the CO=
NFIG_DRM_LEGACY option is unset.<br /><br />git shows me the following bran=
ch<br /><br /><span style=3D"font-family: monospace;"><span style=3D"color:=
 #000000; background-color: #ffffff;">git describe --tags </span><br />dunf=
ell-23.0.8-49-g43060f59ba<br /><br /><br /></span>

--zfBFAZP5ueotmfK9Dfhs--
