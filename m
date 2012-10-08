Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F8C7E01275;
	Mon,  8 Oct 2012 04:18:27 -0700 (PDT)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Oct 2012 04:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,553,1344236400"; d="scan'208";a="231207742"
Received: from unknown (HELO helios.localnet) ([10.252.122.50])
	by fmsmga001.fm.intel.com with ESMTP; 08 Oct 2012 04:18:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Mon, 08 Oct 2012 12:18:24 +0100
Message-ID: <7034165.eLERhWRCDa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-31-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CALbNGRRRk1HRJx4Ahk1E8AiB+MFxqa4m1y38GDhycPwgHBREag@mail.gmail.com>
References: <CALbNGRRRk1HRJx4Ahk1E8AiB+MFxqa4m1y38GDhycPwgHBREag@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Oct 2012 11:42:10 -0700
Cc: meta-ti@yoctoproject.org, yocto@yoctoproject.org,
	gumstix-users@lists.sourceforge.net, angstrom-distro-devel@linuxtogo.org
Subject: Re: [yocto] meta-gumstix proceedings
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
X-List-Received-Date: Mon, 08 Oct 2012 11:18:27 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Andreas,

On Monday 08 October 2012 12:54:46 Andreas M=FCller wrote:
> as some of you might know, gumstix created an official BSP layer
> [1][2]. To avoid confusion I renamed my layer from meta-gumstix to
> meta-gumstix-community [3]. Users should either switch to the officia=
l
> meta-gumstix layer or rename meta-gumstix to meta-gumstix-community
> [3] in git configuration (users of angstrom-setup-scripts should also=

> change the name in layers.txt).

So what should we do with the layer index [4]? Do we list both? What is=
 the=20
delta between them, and is there a hope that there will be only one lay=
er at=20
some point?

Cheers,
Paul

[4] http://www.openembedded.org/wiki/LayerIndex

--=20

Paul Eggleton
Intel Open Source Technology Centre

