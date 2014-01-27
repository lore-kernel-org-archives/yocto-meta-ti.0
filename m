Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C65D3E006BC
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 07:45:05 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0RFj2Ai007360;
	Mon, 27 Jan 2014 09:45:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RFj1p8005989;
	Mon, 27 Jan 2014 09:45:02 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 09:45:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0RFj0HM013598;
	Mon, 27 Jan 2014 09:45:01 -0600
Date: Mon, 27 Jan 2014 10:45:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: =?iso-8859-1?Q?Andr=E9?= Prado <andreprado88@gmail.com>
Message-ID: <20140127154500.GA30525@edge>
References: <CAG=2wZcTH-doyKGPCjLT+9K2R_bZTZUz1cz39BVX9WQfXnjSaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAG=2wZcTH-doyKGPCjLT+9K2R_bZTZUz1cz39BVX9WQfXnjSaQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Trying to build for BBB but can't fetch linux-ti-staging-3.12.8
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
X-List-Received-Date: Mon, 27 Jan 2014 15:45:08 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Jan 25, 2014 at 10:25:54PM -0200, André Prado wrote:
> Hello i am trying to build a Yocto image for the Beaglebone black but i am
> not having any success.
> 
> This task keeps running for ever: linux-ti-staging-3.12.8-r21a+
> gitrAUTOINC+af17c0c3a9 do_fetch

Most probably it's just cloning the git tree, which could take some time.


> I've runned this: it clone git://
> git.ti.com/ti-linux-kernel/ti-linux-kernel.git with success.
> 
> bitbake linux-ti-staging -c cleansstate returns me this:
> http://pastebin.com/eAvJvTUU
> 
> bitbake -v linux-ti-staging -c fetch returns me this:
> http://pastebin.com/5RaRPeV9

There seems to be some kind of exception in bitbake...


> build/tmp/work/beaglebone-
> poky-linux-gnueabi/linux-ti-staging/3.12.8-r21a+gitrAUTOINC+af17c0c3a9/temp/log.do_fetch
> returns me this:
> http://pastebin.com/AmptCBFw
> 
> DEBUG: Mirror fetch failure for url
> http://downloads.yoctoproject.org/mirror/sources/git2_git.ti.com.ti-linux-kernel.ti-linux-kernel.git.tar.gz(original
> url: git://
> git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-linux-3.12.y
> )

And this just means there are no mirrors with this file, which is expected, as 
it's a live git repository.

-- 
Denys

