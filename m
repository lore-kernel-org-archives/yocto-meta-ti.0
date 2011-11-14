Return-Path: <tom.rini@gmail.com>
Received: from mail-qw0-f41.google.com (mail-qw0-f41.google.com
	[209.85.216.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 550D2E00303
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 06:27:57 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qadc11 with SMTP id c11so7168517qad.14
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 06:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=NyZAeH9hIqjqP8+/HMT1VYXpyovJyqw+zr6mPQR9E2A=;
	b=hXqmtI3FW9e91s138mTFmwzpjkxVrFU1NZ7I4B3H+gBLRiIZ29+GDuFJoifP6Hf/rd
	nOjo5v6k7KbCWwt21VvwbErPfLxCUERZ601JhrBOQF8qIFeuRdH0FG5blHvtoi6VGc/l
	NcID3GH7cC4XSOugQ0IQ6KgnVF1dHoruIAr1Y=
MIME-Version: 1.0
Received: by 10.229.67.19 with SMTP id p19mr452382qci.188.1321280876513; Mon,
	14 Nov 2011 06:27:56 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Mon, 14 Nov 2011 06:27:56 -0800 (PST)
In-Reply-To: <3FD3E4DD-ED39-4FF0-9AE3-182464089A74@dominion.thruhere.net>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
	<489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
	<CAPOJ94P8ahYWx+t9b=LfMnBAD2L130P-_kuEcaM9524VsOVQug@mail.gmail.com>
	<CA+M6bXntXWXNwuMEes=hXx7ECUwDUbjnHvLZuJC4c0oU2at6kQ@mail.gmail.com>
	<0EC00F0A-F11C-46D7-9AA8-7519EC67A211@dominion.thruhere.net>
	<CA+M6bXno8T=v61frO1eRvS0t+NMfR2JufALRimCsgUJJ3wWTdw@mail.gmail.com>
	<3FD3E4DD-ED39-4FF0-9AE3-182464089A74@dominion.thruhere.net>
Date: Mon, 14 Nov 2011 07:27:56 -0700
Message-ID: <CA+M6bX=QacwG2JjFT1MVU+Vzps+UN62ZZEGjv9bxLWB6AuNW_g@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 14 Nov 2011 14:27:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2011 at 7:20 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 14 nov. 2011, om 15:19 heeft Tom Rini het volgende geschreven:
>
>> On Mon, Nov 14, 2011 at 3:15 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>
>>> Op 13 nov. 2011, om 22:06 heeft Tom Rini het volgende geschreven:
>>>
>>>> On Sun, Nov 13, 2011 at 11:57 AM, Peter Bigot <bigotp@acm.org> wrote:
>>>>> On Sun, Nov 13, 2011 at 12:42 PM, Koen Kooi <koen@dominion.thruhere.n=
et> wrote:
>>>>>>
>>>>>> Op 13 nov. 2011, om 19:25 heeft Peter A. Bigot het volgende geschrev=
en:
>>>>>>
>>>>>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>>>>>
>>>>>>> Generalize the search for MLO to install to have correct path for c=
opies
>>>>>>> placed in ${DEPLOY_DIR_IMAGE} by x-load.inc, and to continue for SP=
L builds
>>>>>>> where there is no MLO.
>>>>>>>
>>>>>>> Allow user to override the loop mount point as well as the loop dev=
ice, for
>>>>>>> folks who don't want long paths to temporary directories in their f=
stabs.
>>>>>>>
>>>>>>> Add noauto to example fstab entries so systems will boot without at=
tempting
>>>>>>> to mount an unconfigured loopback device.
>>>>>>>
>>>>>>> Remove IMAGE_FSTYPE_append which does not belong in this class.
>>>>>>
>>>>>> I like the fstab changes, but not the others, could you please split=
 this patch?
>>>>>
>>>>> Sure, next time I have to sync with meta-ti. =A0Without the MLO fixes
>>>>> I'd end up with something that doesn't work, and I don't want to blow
>>>>> another half hour testing a script I can't use.
>>>>
>>>> I guess I need to hurry up and bug Koen about switching beagleboard to
>>>> the SPL tree then :)
>>>
>>> Does your v3 work when applied on top of 2011.09?
>>
>> Won't apply, no. =A0But my 05.03.01.00 branch is good for beagleboard,
>> am3517* and omap3evm.
>
>
> How much non-beagle and non-SPL patches does that have in there? For beag=
le we *really* want as little patches on top of upstream as possible. If th=
at means moving to latest denx git, so be it.

Well, it's a joint tree for those boards + ti814x/ti816x (but those
aren't the latest/greatest, just an older iteration) and of course
am335x.  In terms of non-SPL changes, it's changing the OTG port to
default to a usb host in U-Boot (from a USB gadget), and non 1-bit
NAND ECC stuff.  am3517 evm also gets ethernet support (crane could,
trivially, just need a tester).  omap3evm also gets an ethernet
releated bugfix.

--=20
Tom

