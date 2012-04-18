Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FFE6E013BA
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 23:01:54 -0700 (PDT)
Received: by wgbds11 with SMTP id ds11so270373wgb.5
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 23:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=agZhJQFmhcCCEw/iH0eWSt+3mR8eBiPPi3zfikjPMUs=;
	b=ZleOyEgYVjl75DG/vr4FGHfNWgU3nQAcQfEHsHLde37ifN5s/KQzvTjZmSaqiNsEN1
	vFH1Myz8YG3kwXGdZN2n99Wfbld6xQhIaUc6cyZYuXYdWpW+3FsBVmBpQygBYfs4LTlk
	IGxBnpKb8mUAj2oYvw2KO2wlkZRh2b8EQqwH9GSSiEC3u1QwJQbso/NMpBOoZb7DA0iy
	Z08CodNBgbYb/3G3l3HwOcYAPGkW9ctCosOugziZ6ZFDjoYpBjbYCUjkIe7665naR3M5
	AKial0/0q+XQR8IeqIL5Rg2ZVnSYq5ClX6hNe3XvNbKjRn3F4ISactRx2Q9pM0uzSGG6
	xVkQ==
Received: by 10.180.102.129 with SMTP id fo1mr2982448wib.6.1334728913033;
	Tue, 17 Apr 2012 23:01:53 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n8sm51687436wix.10.2012.04.17.23.01.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 23:01:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120417205054.GC8228@denix.org>
Date: Wed, 18 Apr 2012 08:01:54 +0200
Message-Id: <09DDD803-C1E9-4143-93F6-D398905D40A1@dominion.thruhere.net>
References: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
	<1334666866-24955-3-git-send-email-koen@dominion.thruhere.net>
	<20120417205054.GC8228@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlwGokbFkFSo+D3Za3AiVAIpbr7EHjlyMn4chknVb67A8W7zRkl02GUSV7FqnRnyY8cJgDU
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH v2 3/7] beaglebone-capes: userspace support for capes
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
X-List-Received-Date: Wed, 18 Apr 2012 06:01:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 apr. 2012, om 22:50 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Tue, Apr 17, 2012 at 02:47:42PM +0200, Koen Kooi wrote:
>> Not everything can be done inside the kernel yet, so have a script =
that does the userspace portion.
>> Only the LCD3 cape is supported currently, more will follow later.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> recipes-ti/beagleboard/beaglebone-capes.bb         |   23 =
++++++++++++++++++++
>> .../beagleboard/beaglebone-capes/cape.service      |    8 +++++++
>> recipes-ti/beagleboard/beaglebone-capes/cape.sh    |   12 ++++++++++
>> 3 files changed, 43 insertions(+), 0 deletions(-)
>> create mode 100644 recipes-ti/beagleboard/beaglebone-capes.bb
>> create mode 100644 =
recipes-ti/beagleboard/beaglebone-capes/cape.service
>> create mode 100755 recipes-ti/beagleboard/beaglebone-capes/cape.sh
>>=20
>> diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb =
b/recipes-ti/beagleboard/beaglebone-capes.bb
>> new file mode 100644
>> index 0000000..88d4a17
>> --- /dev/null
>> +++ b/recipes-ti/beagleboard/beaglebone-capes.bb
>> @@ -0,0 +1,23 @@
>> +DESCRIPTION =3D "Userspace setup for beaglebone capes"
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
>> +
>> +inherit allarch
>=20
> Should there be "inherit systemd" and SYSTEMD_SERVICE_${PN} =3D =
"cape.service"?

No, that would be just stupid, the package overhead would be bigger than =
the actual packages. I agree systemd.bbclass is broken with its =
WARNINGs, but that's not a good reason to make the recipes even more =
stupid :)

regards,

Koen.=

