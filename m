Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B7CAE00746
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 12:31:29 -0700 (PDT)
Received: by wibhn14 with SMTP id hn14so6684442wib.11
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 12:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VsGc5sZ4NA7aT1FLiqNHN5FF0Wvoo2lWVe/jTgfXuQ4=;
	b=avVYKl0W5RGgVk/sMUiwktdLXRsngP86Nf6OoeywDTEMyoG20Tq0IjzQBinJ7sJ5iy
	V2+3BEk0s79U5nm2PhZUhezemSRWnXmsAo1vEz3dSZt+snJULeOPW/nVMNU+FBuVKi/A
	kSHIwPH4wWFNkt/B7QAUkSGzn8jp5S8Q/OtGLboEL1lisp5GA0EVva0Qcd5zcLenDXi4
	JKktlHzDYl+Vtuv2FThljv/qDYS4PkbPELohsbqVLKSZAJKi2sdSmi2N2ySX72kgq5Y2
	oQ8AiBreX3UI1qWmWBCsQH+Fqe+AkeKIded1RSQXQSo0v7BvW/LnxUj67uRiT3Cj4cKR
	qoRQ==
Received: by 10.180.91.225 with SMTP id ch1mr21253837wib.18.1337283088346;
	Thu, 17 May 2012 12:31:28 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm24130021wib.0.2012.05.17.12.31.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 12:31:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120517182805.GJ6829@denix.org>
Date: Thu, 17 May 2012 21:31:25 +0200
Message-Id: <E8D1DE16-5136-47F1-AAE0-EEAAD9C8BBA2@dominion.thruhere.net>
References: <1337249227-9151-1-git-send-email-koen@dominion.thruhere.net>
	<1337249227-9151-2-git-send-email-koen@dominion.thruhere.net>
	<20120517182805.GJ6829@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnRHGp7P2CXq6AtXAtbfUzesW+JP2irrBaH1SBysCaqfgvH0w/pB7hS7KUX7gvwjrSrbxN6
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH 2/2] linux-ti33x-psp 3.2: correct PV for non-tipsp distros
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
X-List-Received-Date: Thu, 17 May 2012 19:31:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2012, om 20:28 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Thu, May 17, 2012 at 12:07:07PM +0200, Koen Kooi wrote:
>> The patchset updates the kernel to 3.2.x, so make PV match.
>> This doesn't need PR or MACHINE_KERNEL_PR bumps since the both the =
kernel ABI and file locations remain the same.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    4 ++++
>> 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb =
b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>> index 0fe3d4f..efc5adb 100644
>> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>> @@ -10,6 +10,10 @@ S =3D "${WORKDIR}/git"
>>=20
>> MULTI_CONFIG_BASE_SUFFIX =3D ""
>>=20
>> +# the PATCHES_OVER_PSP updates it to 3.2.x, so adjust PV to match
>> +PV =3D "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", =
"3.2.16", d)}"
>> +FILESPATH =3D. =
"${FILE_DIRNAME}/${PN}-3.2:${FILE_DIRNAME}/${PN}-3.2/${MACHINE}:"
>=20
> Are you planning to use ${PN}-3.2.16 in FILESPATH for patches or =
defconfigs?=20
> If not, I'd like to try to fix it differently...

I went for the minimal patch, I have no objection to you fixing it =
properly :)

regards,

Koen=

