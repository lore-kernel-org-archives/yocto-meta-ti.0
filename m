Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A86E3E0051D
	for <meta-ti@yoctoproject.org>; Mon, 13 May 2013 12:20:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4DJKM0r006612;
	Mon, 13 May 2013 14:20:22 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4DJKMg6029686;
	Mon, 13 May 2013 14:20:22 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 13 May 2013 14:20:22 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r4DJKMns013006;
	Mon, 13 May 2013 14:20:22 -0500
Date: Mon, 13 May 2013 15:20:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Pow, Christopher (SWCOE)" <Christopher.Pow@honeywell.com>
Message-ID: <20130513192021.GL17907@edge>
References: <mailman.0.1368467467.29286.meta-ti@yoctoproject.org>
	<7B8A37CE7777314D9B931CDD3BA8C83B1B9F6A72@de08ex3002.global.ds.honeywell.com>
MIME-Version: 1.0
In-Reply-To: <7B8A37CE7777314D9B931CDD3BA8C83B1B9F6A72@de08ex3002.global.ds.honeywell.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: TI SysLink for am180-evm target
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
X-List-Received-Date: Mon, 13 May 2013 19:20:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 13, 2013 at 05:57:03PM +0000, Pow, Christopher (SWCOE) wrote:
> I am trying to integrate the TI Syslink package into a Yocto BSP.  So far I 
> have not been successful.  I have found and downloaded the cgt_c6000 binary 
> installer, but can't figure out how to modify the BitBake recipe to point to 
> it.  [bitbake ti-syslink errors on the fetch phase even though the SRC URI 
> has been modified to point to the downloaded installer binary.]  Also I am 
> unable to find a download link for the TMS470 compiler, which seems to be 
> another dependency for SysLink.  Has anyone successfully integrated the TI 
> SysLink recipe?  Would it be easier to download and build SysLink separately 
> and just install it on top of the targetfs?
> 
> I am trying to meet a very demanding schedule so I'd appreciate any help 
> anyone can provide.

Well, strictly speaking none of AMx devices have DSPs in them. That would 
require DMx devices, which are not currently supported in meta-ti.

-- 
Denys

