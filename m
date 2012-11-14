Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24471E0142C
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 17:28:13 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAE1SAKS011862;
	Tue, 13 Nov 2012 19:28:10 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAE1SAEF025310;
	Tue, 13 Nov 2012 19:28:10 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 13 Nov 2012 19:28:10 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qAE1S91P031067;
	Tue, 13 Nov 2012 19:28:10 -0600
Date: Tue, 13 Nov 2012 20:28:09 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Message-ID: <20121114012809.GA13096@edge>
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com> <20121113152237.GA12650@edge>
	<50A26971.40908@r-finger.com>
MIME-Version: 1.0
In-Reply-To: <50A26971.40908@r-finger.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Wed, 14 Nov 2012 01:28:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 13, 2012 at 03:38:25PM +0000, Tomas Frydrych wrote:
> On 13/11/12 15:22, Denys Dmytriyenko wrote:
> >> For Denzil it is not possible to arrange meta-yocto and meta-ti layers
> >> in a way that would work; this has been fixed in Danny (in
> >> meta-yocto-bsp). If you want to stick with Denzil, there are different
> >> ways to work around it, easiest should be to delete the offending
> >> beagleboard.conf from meta-yocto.
> > 
> > Why can't you put meta-ti in front of meta-yocto in Denzil? Works just fine.
> 
> Because meta-yocto layer.conf does:
> 
>   BBPATH := "${LAYERDIR}:${BBPATH}"
> 
> While meta-ti layer.conf does:
> 
>   BBPATH .= ":${LAYERDIR}"
> 
> So regardless how you order it, you get BBPATH that looks like:
> 
>   meta-yocto:meta:meta-ti
> 
> Which guarantees you the beagleboard.conf from meta-yocto.

Ah, right, that was part of the fix couple months ago in the master, besides 
splitting the meta-yocto-bsp off, which got into Danny, but not Denzil. I 
completely forgot about it... Thanks.

-- 
Denys

