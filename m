Return-Path: <pabigot@gmail.com>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7448AE00306
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 06:57:21 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wyg10 with SMTP id 10so1202206wyg.35
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 06:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=iPqCttNTyP11DLmNNX2jj2sc6WnDHxrPE1bkW7EBhK0=;
	b=tqZFgFLlIsw9h/NXl79kC96nGxieTtZtdH22qk7OwU4qJxy75xv204QYhKotMZdJRo
	yqcTkoUzkiDLjyoGphCRu/e5mii6hAZCUojYYHjbAKxSbJLOdFpINvoqEWPFXLu29EpW
	E3wCMbgP3vdmIrGFGcQLt25H2TlsYasrZtnkc=
MIME-Version: 1.0
Received: by 10.216.229.17 with SMTP id g17mr1134174weq.40.1321282640161; Mon,
	14 Nov 2011 06:57:20 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.30.200 with HTTP; Mon, 14 Nov 2011 06:57:20 -0800 (PST)
In-Reply-To: <489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
	<489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
Date: Mon, 14 Nov 2011 08:57:20 -0600
X-Google-Sender-Auth: Zu1pCCYdhTNO4b9vJVQN1KB5Hq0
Message-ID: <CAPOJ94OE+ALWZkov_w73bh4v2C85X-0MHg+RZDxFhOURqDsAYQ@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
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
X-List-Received-Date: Mon, 14 Nov 2011 14:57:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 13, 2011 at 12:42 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 13 nov. 2011, om 19:25 heeft Peter A. Bigot het volgende geschreven:
>
>> From: "Peter A. Bigot" <bigotp@acm.org>
>>
>> Generalize the search for MLO to install to have correct path for copies
>> placed in ${DEPLOY_DIR_IMAGE} by x-load.inc, and to continue for SPL builds
>> where there is no MLO.
>>
>> Allow user to override the loop mount point as well as the loop device, for
>> folks who don't want long paths to temporary directories in their fstabs.
>>
>> Add noauto to example fstab entries so systems will boot without attempting
>> to mount an unconfigured loopback device.
>>
>> Remove IMAGE_FSTYPE_append which does not belong in this class.
>
> I like the fstab changes, but not the others, could you please split this patch?

So I can prepare more appropriate patches now and in the future, please explain:

* Why do you want to hard-code the MLO symlink paths in the install
and deploy directories instead of using the bitbake variables that
x-load.inc uses for those paths?

* Why do you want IMAGE_FSTYPE to be extended with .tar.bz2 when this
class has nothing to do with tar.bz2 images?

* Why do you want IMAGE_FSTYPE to be set in the class when every other
image recipe in openembedded puts IMAGE_FSTYPE modifications in the
recipe that incorporates the image?

Thanks.

Peter

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk7AD4IACgkQMkyGM64RGpGW8gCgrK/QEYtpHxYDuOHPuONYeJlv
> TZgAmQGlt/0ZCZoRvbNbqUpCr6QpT0P3
> =Az4V
> -----END PGP SIGNATURE-----
>
>

