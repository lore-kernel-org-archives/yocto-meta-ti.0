Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E84FFE011AD
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 10:41:02 -0700 (PDT)
Received: by eekd41 with SMTP id d41so1379043eek.35
	for <meta-ti@yoctoproject.org>; Tue, 07 Aug 2012 10:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=CBlxHObqEtkQMsYw31gOWeOZj6rONr3M1qHKvYC5UfY=;
	b=OH8vu/DFnlQG61mWne44qX2l4cIYUNABKyuVrZaYbM6zF9uaLugcPHOtIVwzWqb0P2
	DPNruNgAr4CJRWD5G8fb250NMR9QAWSe8MOTp1bTKm2jaB9A6PpCvsAXjfbxd9LkbTiX
	+dfzNg41bxPfI2RjvomvGM0oIgrHSXEV0YkP8hPqEW7kOoON767vu0IjnaBJUAwb1tWw
	riestrRuY6hVr0te4L0yLtKySgl8bypFydxcTc1zzzfE4QGWrE39pVXRYhg56nYnxuKT
	g0JMONDztTwKsqR5+EtrXJXphJF1A709ZAGmJSLU4Dvfn7R3FFpr2WAAUpjev8S98Fn/
	CGzA==
Received: by 10.14.218.134 with SMTP id k6mr18814679eep.14.1344361261434;
	Tue, 07 Aug 2012 10:41:01 -0700 (PDT)
Received: from [172.20.0.2] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 45sm10990204eed.17.2012.08.07.10.40.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 10:40:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <50214406.8000704@communistcode.co.uk>
Date: Tue, 7 Aug 2012 19:41:00 +0200
Message-Id: <EE824A43-BF4B-4D06-B382-F06EB8544C4E@dominion.thruhere.net>
References: <5020D9A0.30000@communistcode.co.uk> <20120807153016.GA8716@edge>
	<015A9197-70E1-4195-BA85-71097586D635@dominion.thruhere.net>
	<20120807153806.GC8716@edge> <1344354289.9756.276.camel@ted>
	<20120807155336.GE8716@edge> <50214406.8000704@communistcode.co.uk>
To: ml@communistcode.co.uk
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmN9N+RBNQIDRNDfSG9t1LFDZoSGJwqJ7ZfM5XS06QvuJcppN6VdmM/kb8q1HbWgckmNNOo
Cc: meta-ti@yoctoproject.org
Subject: Re: Turning off kernel config option
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
X-List-Received-Date: Tue, 07 Aug 2012 17:41:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 aug. 2012, om 18:36 heeft Jack Mitchell <ml@communistcode.co.uk> =
het volgende geschreven:

> On 07/08/2012 16:53, Denys Dmytriyenko wrote:
>> On Tue, Aug 07, 2012 at 04:44:49PM +0100, Richard Purdie wrote:
>>> On Tue, 2012-08-07 at 11:38 -0400, Denys Dmytriyenko wrote:
>>>> On Tue, Aug 07, 2012 at 05:32:36PM +0200, Koen Kooi wrote:
>>>>>=20
>>>>> Op 7 aug. 2012, om 17:30 heeft Denys Dmytriyenko <denys@ti.com> =
het volgende geschreven:
>>>>>=20
>>>>>> On Tue, Aug 07, 2012 at 10:02:24AM +0100, Jack Mitchell wrote:
>>>>>>> I am trying to turn of CONFIG_SPI_DEBUG in the beaglebone BSP =
from
>>>>>>> meta-ti. I am using the poky distro configuration and I have =
changed
>>>>>>> the defconfig in
>>>>>>> =
meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
>>>>>>> but it still builds with CONFIG_SPI_DEBUG enabled.
>>>>>>=20
>>>>>> That should be the correct location, please make sure you re-do =
the unpack
>>>>>> task - if you previously built the kernel with the old defconfig, =
it will be
>>>>>> stored in the work directory and won't be copied from the =
repository above,
>>>>>> until you repeat the do_unpack task, i.e. by clenaing the build.
>>>>=20
>>>> BTW, no need to clean the entire build, just the kernel build:
>>>>=20
>>>> $ bitbake virtual/kernel -c clean
>>>>=20
>>>>> Or just increment PR as you're supposed to, it's an output change =
after all.
>>>>> No need to check anything if you do it properly :)
>>>>=20
>>>> Well, but then you are staring to change the recipe, which might be =
overkill
>>>> for a simple defconfig change you want to test. If you go that =
route, you may
>>>> want to create your own custom layer with the modified defconfig =
overlayed on
>>>> top of meta-ti and a simple .bbappend with PRINC. That way your =
changes will
>>>> be detached from meta-ti and you won't need to merge the recipe =
changes every
>>>> time meta-ti updates... Although, there's no way to bbappend the =
defconfig
>>>> itself - that's where config fragments come to play.
>>>=20
>>> With the recent changes to OE-Core, you can edit the defconfig, the
>>> system will notice the checksum change and automatically rerun the
>>> unpack and subsequent steps automagically.
>>=20
>> Richard,
>>=20
>> That is quite useful, thanks for the info!
>>=20
>>=20
>>> If the PR server is enabled, it will bump PR for you too.
>>=20
>> That is something I haven't looked at yet, honestly - too much =
Classic-OE
>> baggage to carry... :)
>>=20
>=20
> Well, this thread took off when I turned my back!
>=20
> Thanks for all the advice and different solutions - I found what my =
issue was and it is that the BeagleBone was booting using the kernel on =
the rootfs rather than the kernel in the fat partition as I believed. So =
I was only replacing the FAT partition uImage and not re-building and =
copying the whole rootfs.
>=20
> Next step is indeed to have an overlay so I can customize the kernel =
config a bit more, along with a patch or two I have in there.

Please post the patches, they might be generally usefull. I don't know =
why spi debug is on, I'm not opposed to turning it off :)=

