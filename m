Return-Path: <tom.rini@gmail.com>
Received: from mail-qw0-f41.google.com (mail-qw0-f41.google.com
	[209.85.216.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FBFAE00303
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 13:06:17 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qam6 with SMTP id 6so1136700qam.14
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 13:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=C9GeYx+QEAKHc+xD2TYn6O/1IP0ZcarjPu3pkceMuBQ=;
	b=MxRaviNdFNzhC0fWrb4hTyvPVf/P9QsbUR+3PKxT8NqTqktji5Ctgb1HkRQdLcsu7q
	VDt6HjTi+PLdYIIzpGtoKCZOC2agEIElyehTAuB4VhU/lCPY6tFm0e+HqrNI72VKBPry
	hnSx6QyxTFTrIL/3ucrXcWf+P1Uegoxe/GubE=
MIME-Version: 1.0
Received: by 10.229.67.19 with SMTP id p19mr167500qci.188.1321218377123; Sun,
	13 Nov 2011 13:06:17 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sun, 13 Nov 2011 13:06:17 -0800 (PST)
In-Reply-To: <CAPOJ94P8ahYWx+t9b=LfMnBAD2L130P-_kuEcaM9524VsOVQug@mail.gmail.com>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
	<489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
	<CAPOJ94P8ahYWx+t9b=LfMnBAD2L130P-_kuEcaM9524VsOVQug@mail.gmail.com>
Date: Sun, 13 Nov 2011 14:06:17 -0700
Message-ID: <CA+M6bXntXWXNwuMEes=hXx7ECUwDUbjnHvLZuJC4c0oU2at6kQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Peter Bigot <bigotp@acm.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] sdcard_image bbclass: fix MLO copy, loop device mounts, fstypes
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
X-List-Received-Date: Sun, 13 Nov 2011 21:06:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2011 at 11:57 AM, Peter Bigot <bigotp@acm.org> wrote:
> On Sun, Nov 13, 2011 at 12:42 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>
>> Op 13 nov. 2011, om 19:25 heeft Peter A. Bigot het volgende geschreven:
>>
>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>
>>> Generalize the search for MLO to install to have correct path for copie=
s
>>> placed in ${DEPLOY_DIR_IMAGE} by x-load.inc, and to continue for SPL bu=
ilds
>>> where there is no MLO.
>>>
>>> Allow user to override the loop mount point as well as the loop device,=
 for
>>> folks who don't want long paths to temporary directories in their fstab=
s.
>>>
>>> Add noauto to example fstab entries so systems will boot without attemp=
ting
>>> to mount an unconfigured loopback device.
>>>
>>> Remove IMAGE_FSTYPE_append which does not belong in this class.
>>
>> I like the fstab changes, but not the others, could you please split thi=
s patch?
>
> Sure, next time I have to sync with meta-ti. =A0Without the MLO fixes
> I'd end up with something that doesn't work, and I don't want to blow
> another half hour testing a script I can't use.

I guess I need to hurry up and bug Koen about switching beagleboard to
the SPL tree then :)

--=20
Tom

