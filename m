Return-Path: <raj.khem@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FE70E011AD
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 08:03:56 -0700 (PDT)
Received: by eabd1 with SMTP id d1so776033eab.35
	for <meta-ti@yoctoproject.org>; Tue, 07 Aug 2012 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zfRyiPtvnvUEmAS2wXchCyNBguxALRbKqwFcB6Xt6ZA=;
	b=auEecZP/NlOqOrHqEuvtIiIby4IQLrXfxpfCTj59WRDF5KXT6XUHQKkfwk+gVOBT4u
	De4II+6IjgsS8/j0ZuiIDKyxNA9llTZjOqRCWIOtOVhHyU+EBgKkpP26X0/rJGsgn2wN
	ts9PGQvnNXCnYyHr8pwmOy/sNKEuct4AUV76odRAg1nkZDTUk7Xw/RUAze55dFhoggsX
	k/e7SgAokt2/hgIYooFmURk4Ia5mBozP91th3FyfzZklrNNnvzdKuN5/ruuKAT70fX4J
	c5/+xxTPtaNWoDAAqvAYuxMayBmfsvQui/Yhg6VOOGcA320EnlO3ug8r8UkhT4S2cHMM
	lZUQ==
Received: by 10.14.213.137 with SMTP id a9mr18016854eep.38.1344351835644; Tue,
	07 Aug 2012 08:03:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Tue, 7 Aug 2012 08:03:25 -0700 (PDT)
In-Reply-To: <5020D9A0.30000@communistcode.co.uk>
References: <5020D9A0.30000@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Aug 2012 08:03:25 -0700
Message-ID: <CAMKF1sr01DpVysoqc5+hT6S2Cr9+p5oLa-RSu+gssWJD=LYmFQ@mail.gmail.com>
To: ml@communistcode.co.uk
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
X-List-Received-Date: Tue, 07 Aug 2012 15:03:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 7, 2012 at 2:02 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> I am trying to turn of CONFIG_SPI_DEBUG in the beaglebone BSP from meta-ti.
> I am using the poky distro configuration and I have changed the defconfig in
> meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig but it
> still builds with CONFIG_SPI_DEBUG enabled.
>
> Do the meta-ti kernels support BSP config fragments like the yocto kernels
> or is there a better way to do this?
>

dont think so. you can make the change in defconfig directly

> Regards.
>
> --
>
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   http://www.embed.me.uk
>
> --
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

