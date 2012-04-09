Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7D90E01374
	for <meta-ti@yoctoproject.org>; Mon,  9 Apr 2012 02:08:10 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so1899435wib.11
	for <meta-ti@yoctoproject.org>; Mon, 09 Apr 2012 02:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VcbPoHZbJPw9rVJr4LeRhVMiC7i9zxIw1jzz0jI3umk=;
	b=lCs0vJdG85iA1729b+0yRyR/lxkQM/5TsYM/86wLoS29OoE7KbGG33ZrDoTzsAnIcZ
	5iOkvi5lothQZtvNjNguWW8ypupLgpTSNwst7SOb3UmnQ86Aun4IThBup1GKReOKqlo1
	+tcphFNZgnS/4Qdv+eqgixkFo+VEmNVeldq4bjrisHo9xOwF0wbyaIkbkCIHIhXMv9fV
	y1xcyFjU3aaROB3j42QW+NR0bUakzpeNR7RDUX8etA6Mxh1Jq+VQre7IY8BUFr00A2Z3
	maACsSTWfFWDYBS3F5m9mIwz2myx5bnQs7zYtYEVnNKevka65r2Yb4Phuc6ZB54Qz0P+
	Tvew==
Received: by 10.180.95.129 with SMTP id dk1mr16737551wib.3.1333962489385;
	Mon, 09 Apr 2012 02:08:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm46648472wiv.11.2012.04.09.02.08.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 02:08:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <868vi5gutt.fsf_-_@coulee.tdb.com>
Date: Mon, 9 Apr 2012 11:08:06 +0200
Message-Id: <32E2D6B5-FF5A-4FE9-81A3-DDAC31318CC9@dominion.thruhere.net>
References: <86pqbmm4oe.fsf@coulee.tdb.com> <20120405191501.GB5144@denix.org>
	<86bon5nc3h.fsf@coulee.tdb.com> <86zkapljsw.fsf@coulee.tdb.com>
	<20120409014021.GD10246@denix.org>
	<868vi5gutt.fsf_-_@coulee.tdb.com>
To: Russell Senior <russell@personaltelco.net>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQn93l+yu1o7X9r00uGqd/g10PvHIT5JgAfh+AJ0gT3GJ11/jIOgnfK4zu1CuewE0XIuMm5g
Cc: meta-ti@yoctoproject.org, angstrom-distro-devel@linuxtogo.org
Subject: Re: [PATCH] apply recommended kernel config for beaglebone
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2012 09:08:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 apr. 2012, om 10:42 heeft Russell Senior het volgende geschreven:

>=20
> Apply recommended kernel config per:
>=20
>  =
http://dominion.thruhere.net/koen/cms/recommended-kernel-config-options-fo=
r-a-modern-angstrom-system
>=20
>=20
> Signed-off-by: Russell Senior <russell@personaltelco.net>
> ---
> .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git =
a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig =
b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> index 782f52d..6cb725b 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> @@ -82,7 +82,8 @@ CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_CGROUPS=3Dy
> -# CONFIG_CGROUP_DEBUG is not set
> +CONFIG_CGROUP_DEBUG=3Dy
> +CONFIG_CGROUP_NS=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CPUSETS=3Dy
> @@ -3150,8 +3151,8 @@ CONFIG_QUOTA_TREE=3Dm
> CONFIG_QFMT_V2=3Dm
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> -CONFIG_FUSE_FS=3Dm
> -CONFIG_CUSE=3Dm
> +CONFIG_FUSE_FS=3Dy
> +CONFIG_CUSE=3Dy
> CONFIG_GENERIC_ACL=3Dy

Apart from the missing PR bump, the changes have no effect on systemd, =
c/fuse can be a module and cgroup debugging isn't needed.=

