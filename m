Return-Path: <pabigot@gmail.com>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C9A8E00502
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 10:57:12 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by wwi36 with SMTP id 36so5227495wwi.11
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 10:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=WKOKpNzmPcgYjOwOWwW5oIHDkLSLccoS+YGoOUGO0pg=;
	b=l3zEYgxk8xxDivBNRGpBkrTra1LhQytSf+7fzdfVkcnOw5vwRbv9HrO0gsoLrGhHa4
	mQroHlP42ZYPWAaF7bNHt0viFsn6jof6f/5Xk5tfIKpBtBUVMmXqLZ+a/I2+UiPjaHfv
	BTEs87xiL+WTZTfkEQv5BWhDrK24sWFczPRI0=
MIME-Version: 1.0
Received: by 10.216.229.17 with SMTP id g17mr561373weq.40.1321210631254; Sun,
	13 Nov 2011 10:57:11 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.30.200 with HTTP; Sun, 13 Nov 2011 10:57:11 -0800 (PST)
In-Reply-To: <489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
References: <1321208655-9701-1-git-send-email-bigotp@acm.org>
	<1321208716-9749-1-git-send-email-bigotp@acm.org>
	<489EAC51-52A8-48BC-92F8-6905B9E94589@dominion.thruhere.net>
Date: Sun, 13 Nov 2011 12:57:11 -0600
X-Google-Sender-Auth: qNgirLNIoHWBR73rYd8hvSvClbw
Message-ID: <CAPOJ94P8ahYWx+t9b=LfMnBAD2L130P-_kuEcaM9524VsOVQug@mail.gmail.com>
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
X-List-Received-Date: Sun, 13 Nov 2011 18:57:13 -0000
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

Sure, next time I have to sync with meta-ti.  Without the MLO fixes
I'd end up with something that doesn't work, and I don't want to blow
another half hour testing a script I can't use.

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

