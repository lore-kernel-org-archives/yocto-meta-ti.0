Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0467FE00292
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:40:01 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so2285960vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=1VS0P46cWdMdT59pCjr9/lEfMN7fP7qvT6u1jnRngoE=;
	b=VkbFHtpj3TUGbAzpiRb8ugJENKu3FP2Dng7frcIMuzlfeAc4TOFS816hCQabJO3kiK
	df+OhdBYiMihbiEk0bWtM6P2uBhk2eAbG4AoH1+hH2XXlCiZRuwFs3rFrdJpKna2PcGl
	dgNFMZPpRfMxqw0Z/4kRPFeADws2hME709AtswmEu6SNQtjn+tMZdDNGdFNfrhUEg7Ok
	drqBNO8b8aS2X8gOPF3Ph9Z/PBLqEvPkZFnhiWZHBlUGypSxCfxV/sPWByy9FYFSCGnB
	PCqntfNS5Evw6TBx1Dx/U+VJdx7H3ezVPUoDAf5/+zkwP14Ea8hqPskdLlMwpuL1jJ53
	/0FQ==
MIME-Version: 1.0
Received: by 10.52.88.15 with SMTP id bc15mr176438vdb.102.1349952001332; Thu,
	11 Oct 2012 03:40:01 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Thu, 11 Oct 2012 03:40:01 -0700 (PDT)
In-Reply-To: <50767E49.7030104@ti.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<CA+2YH7t7+XWaaf549x7JOkEpksAH6gTsZVdq=7qAZ8CYxmnmOg@mail.gmail.com>
	<50767E49.7030104@ti.com>
Date: Thu, 11 Oct 2012 12:40:01 +0200
X-Google-Sender-Auth: zyse5fUqeP_xlvn9HfN7HhSxjH0
Message-ID: <CA+2YH7tk2hAB32YXHqbf4ddmXz57QOyytG9wjUk+W1s-Ge3TSQ@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: =?ISO-8859-1?Q?Herv=E9_Fache?= <h-fache@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/6] linux-omap4: update to ti-ubuntu-3.4-1487.6
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
X-List-Received-Date: Thu, 11 Oct 2012 10:40:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 11, 2012 at 10:07 AM, Herv=E9 Fache <h-fache@ti.com> wrote:
> Ciao Enrico,
>
> Your patches look good so far! I shall share my tree in a bit so we can
> help each-other.
> Note that the configuration we use is derived from Ubuntu and is in
> debian.ti-omap4/config/config.common.ubuntu. It creates zillions of
> modules (> 2000), so we probably want to reduce it though, but some
> options will be necessary for RPMsg and PM.

Salut Herv=E8,

i used that config just because it was the first one that worked,
probably i took the wrong/incomplete config.common.ubuntu at first.

I can modify the defconfig i used based on feedback or i can switch to
another one and tweak it, i am open to feedback/directions.

For example the current defconfig uses the performance scaling
governor, i'd change it into ondemand.

Enrico

