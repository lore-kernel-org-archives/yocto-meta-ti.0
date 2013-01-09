Return-Path: <ndec13@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF68EE01439
	for <meta-ti@yoctoproject.org>; Wed,  9 Jan 2013 00:02:13 -0800 (PST)
Received: by mail-qc0-f182.google.com with SMTP id k19so1404780qcs.13
	for <meta-ti@yoctoproject.org>; Wed, 09 Jan 2013 00:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=27zb0OrN9jovOhPUJLSLlbKBNhRIK6zLXU3zxThquLg=;
	b=CvBOUjJKrOjctAUYQBCO4MsMFSOMr2b7BTM+p+Kv2/gW8uzo+AR8CfMd4ATWfKE8nc
	euatDQp50revKuWpY9mIoJRh3lIF+svpEicqJMFBTxlVxSdfLYhVDfZOEKpdvu9+g++D
	Vc3SQrPguO5xB+RAfzYMn/eMChVxLsuHt//X3VlVzyDRcnNHDIQ1+DP+qc8V0Qoftmit
	iFvnxBVMOAagqwH+//QNVqvcSDJyWXjB/00LqUYctRQjcKcsn4KoKeEF81ZMQ78YjWRl
	Der+tnh8U07YSJ46sIonvensVDsd4bzpvY+VpBMi5OAqFkWxg51QrutUMlLmLwP1Q8Ds
	kzNw==
Received: by 10.49.16.9 with SMTP id b9mr57651505qed.16.1357718533251; Wed, 09
	Jan 2013 00:02:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.49.127.7 with HTTP; Wed, 9 Jan 2013 00:01:52 -0800 (PST)
In-Reply-To: <CANmVirii6vJvYyAR-a6wOHjFwoSnpqk5vSipnkXQSU6rZPVmKA@mail.gmail.com>
References: <CANmVirii6vJvYyAR-a6wOHjFwoSnpqk5vSipnkXQSU6rZPVmKA@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Wed, 9 Jan 2013 09:01:52 +0100
Message-ID: <CAOT3miLOCbazfMvaW8E2mV3o+uJwJYoU5GZ2PCRQXQ43qSwe6Q@mail.gmail.com>
To: Raul Rosetto Munoz <munoz0raul@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Creating simple linux for beaglebone
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
X-List-Received-Date: Wed, 09 Jan 2013 08:02:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 9, 2013 at 2:38 AM, Raul Rosetto Munoz <munoz0raul@gmail.com> w=
rote:
> Hello all,
>
> I want to create a simples linux for beaglebone using yocto danny.
>
> I did all the necessary clones:
> poky
> meta-ti
> meta-openembedded
>
> I changed all to danny branch!
>
> After these sets I did the poky source:
> source poky/oe-init-build-env beaglebone-linux
>
> Changed the machine to beaglebone
>
> MACHINE ?=3D "beaglebone"
>
> Changed the bblayer to:
>
> BBLAYERS ?=3D " \
>   /home/prjs/video0001/linux/poky/meta \
>   /home/prjs/video0001/linux/poky/meta-yocto \
>   /home/prjs/video0001/linux/poky/meta-yocto-bsp \
>   /home/prjs/video0001/linux/meta-ti \
>   /home/prjs/video0001/linux/meta-openembedded/meta-oe  \
>   "
>
>
> And finaly when I run bibake core-image-minimal
>
>
>
> munoz@munoz:/home/prjs/video0001/linux/linux-bone$ bitbake
> core-image-minimal
> Loading cache: 100%
> |########################################################################=
##########################|
> ETA:  00:00:00
> Loaded 4 entries from dependency cache.
> ERROR: ParseError at
> /home/prjs/video0001/linux/meta-ti/recipes-misc/payload/bonescript.bb:5:
> Could not inherit file classes/systemd.bbclass
> ERROR: This recipe does not have the LICENSE field set (cloud9-gnome-imag=
e)
> ERROR: Command execution failed: Exited with 1
>
> Summary: There were 3 ERROR messages shown, returning a non-zero exit cod=
e.

you need to add

BBMASK =3D "meta-ti/recipes-misc"

in local.conf, as mentioned here
http://www.crashcourse.ca/wiki/index.php/Getting_started:_OE%2C_meta-ti_and=
_the_PandaBoard_ES.


>
> Some one can Help me??
>
> Thanks for all help
>
> --
> Raul Rosetto Mu=F1oz
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

