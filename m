Return-Path: <raj.khem@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BFFEE01351
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 06:55:34 -0700 (PDT)
Received: by eekb45 with SMTP id b45so1060968eek.35
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 06:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=aV6Hm/QisfdzJsG1/7B483rd3UeQv/uvLG+nbFXbRac=;
	b=uRcZfDQjYLDMtDPz3wZU6Bn9Q7JgZ+Wpb6bBtCfGDzfXr2vgs32oD/Bm2vU1XVEgE7
	3I9LmqseOeg+FWFpL77oOqrUesxirHHEYjfsBT3S7tv0BUnYnZ5lnNrd/njiczJToshP
	WGYg/LlqQK88GDjnO8e3z8Gzjbka7Qo4JNMItG4VAnKEHXGyoC6Ic8vEw2NeKEuezTeL
	YBc0X8odFGUUtrzEV1n7G2iP3r0vWh833k7yheZSDD7MJJS3hqvWvkBo+lTAIl5RlhPP
	6vLyDRkQKC3jD5+c2yOZpXv8DlaE3icRjjF31jmQ20z1SohAOr6RV2/bComjiAcIouaH
	r3RQ==
Received: by 10.14.220.134 with SMTP id o6mr5987612eep.35.1348754133265; Thu,
	27 Sep 2012 06:55:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Thu, 27 Sep 2012 06:55:01 -0700 (PDT)
In-Reply-To: <EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com>
	<5062FB00.7080307@mlbassoc.com> <506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
	<CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Sep 2012 06:55:01 -0700
Message-ID: <CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
To: Christian.Schulenberg@bmw.de
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard not booting
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 13:55:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 6:47 AM,  <Christian.Schulenberg@bmw.de> wrote:
> Hi,
>
> as I wrote before, I have an older version. I used the kernel version of =
that one to start up my new meta-ivi build. It crashed later with a kernel =
panic, but at least the kernel is running.
>
> After that I compared the two kernel version I have, with mkimage -l.
>
> 1. Kernel version that is working quite well:
>
> mkimage -l uImage
> Image Name:   Linux-3.1.0
> Created:      Fri Sep 21 11:25:32 2012
> Image Type:   ARM Linux Kernel Image (uncompressed)
> Data Size:    4144744 Bytes =3D 4047.60 kB =3D 3.95 MB
> Load Address: 80008000
> Entry Point:  80008000
>
> 2. Kernel version that fails after uncompression:
>
> mkimage -l uImage
> Image Name:   Linux-3.1.0
> Created:      Thu Sep 27 07:07:25 2012
> Image Type:   ARM Linux Kernel Image (uncompressed)
> Data Size:    4176432 Bytes =3D 4078.55 kB =3D 3.98 MB
> Load Address: 80008000
> Entry Point:  80008000
>
> I don't see any major issues here, so I guess I need to check the toolcha=
in as proposed by Enrico.
>

Download denzil SDK for arm which is gcc 4.6 based and compile kernel
using that and see if that boots. There could be some kernel+toolchain
interaction w.r.t gcc 4.7 which is what is
default in current master/(would be 1.3) release, sometimes gcc
exposes latent bugs in kernel
and at times its wise versa

> Christian
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: ebutera@gmail.com [mailto:ebutera@gmail.com] Im Auftrag von Enrico
> Gesendet: Donnerstag, 27. September 2012 14:07
> An: Schulenberg Christian, EI-42
> Cc: meta-ti@yoctoproject.org
> Betreff: Re: [meta-ti] pandaboard not booting
>
> On Thu, Sep 27, 2012 at 1:16 PM,  <Christian.Schulenberg@bmw.de> wrote:
>> I'm using the same kernel version as I did before. It's the default kern=
el 3.1 as configured in the meta-ti layer: ti-ubuntu-3.1.0-1282.11, Revisio=
n: a5c60c099296fcfc0c8fa8085c40883971486512
>>
>> Do you really think it makes sense to switch to a more recent one?
>
> No, but i have no better ideas right now...
>
> You could check if it's a known toolchain bug with that kernel, but i
> think it would be faster to try a newer kernel (from the same
> repository, ti ubuntu integration).
>
> Enrico
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

