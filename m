Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9FAEE0142C
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 05:18:10 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so2394267vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 05:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=chwZGsvr4zUFRYd8XSidfBuPD5Ka8O9amADC+MXs3lo=;
	b=THt+i52OYRa+nzgJ05EIEIZoUkKAEDVHd/K99X5diBhguxz+pcH/os8Bw+TWY1ULZ6
	Wp4FEG/EGfSTKebup3iavDvGfWcg1Hv3v/bNUxyqZsHtuADimYzWsYjCfS7PU0P7GN+f
	HTtuDrd9czt4o2pOS14lS4PFmgLypb1v8U6k76nyiXXOldio6Qj+Spmf2jGf1z7+HUF6
	MvFkeOdXrFXVxxrkReYhH7axzHdDgQYAkTwfJ5SFDKGykl7KZnRfO+N5UJCVWz2/nogF
	QgRpBvLsQtciiSGirNzaQBd/Oi3cS18IBQdnHIMSgVxC1qiebx34CuavNLyp3ejyndHl
	/ChA==
Received: by 10.58.94.109 with SMTP id db13mr369336veb.39.1349957887561; Thu,
	11 Oct 2012 05:18:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 11 Oct 2012 05:17:47 -0700 (PDT)
In-Reply-To: <CA+2YH7unzpCXz9+V2WZUEZeE-9r_yaft220BRyXkSc9eNesRCw@mail.gmail.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-4-git-send-email-ebutera@users.berlios.de>
	<CAOT3miJo3tMK8nAc0x3o=cFBOuoMrUjvSYR61LbH9oGDsa2fvg@mail.gmail.com>
	<CA+2YH7unzpCXz9+V2WZUEZeE-9r_yaft220BRyXkSc9eNesRCw@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 11 Oct 2012 14:17:47 +0200
Message-ID: <CAOT3miLA-+gXGNTtL2iJAtvs61b_jWreaVBTTyTa-BRGDiviXA@mail.gmail.com>
To: Enrico <ebutera@users.berlios.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/6] libdce: add version 1.6.5.3
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
X-List-Received-Date: Thu, 11 Oct 2012 12:18:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 12:53 PM, Enrico <ebutera@users.berlios.de> wrote:
>>> +RDEPENDS = "libdrm ti-firmware-ipu-dce"
>>
>> i would hope that libdrm is not needed in RDEPENDS, as it should be
>> handled automagically by shlibdeps.
>
> I really don't know, if you are sure about that i will just remove it.

well, i am slowly re-learning oe stuff as i have been out of if for a
couple of years... but i think so, and the documentations says it
too..


Some automatic handling occurs around the RDEPENDS variable:

http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.html#var-RDEPENDS

shlibdeps: If a runtime package contains a shared library (.so), the
build processes the library in order to determine other libraries to
which it is dynamically linked. The build process adds these libraries
to RDEPENDS to create the runtime package.

pcdeps: If the package ships a pkg-config information file, the build
process uses this file to add items to the RDEPENDS variable to create
the runtime packages.

