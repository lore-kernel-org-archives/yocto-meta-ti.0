Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49CC4E01439
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 11:31:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4TIVG9p010473;
	Wed, 29 May 2013 13:31:16 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4TIVGc5009932;
	Wed, 29 May 2013 13:31:16 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 May 2013 13:31:15 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4TIVFoA008891;
	Wed, 29 May 2013 13:31:16 -0500
Date: Wed, 29 May 2013 14:31:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: =?iso-8859-1?Q?M=E5ns?= Andersson <Mans.Andersson@nibe.se>
Message-ID: <20130529183115.GC4526@edge>
References: <9271A7A786434844A19F14A6050530257A54569F@NIVM101.nibe.se>
MIME-Version: 1.0
In-Reply-To: <9271A7A786434844A19F14A6050530257A54569F@NIVM101.nibe.se>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: am335x-evm nand flash support
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
X-List-Received-Date: Wed, 29 May 2013 18:31:19 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 29, 2013 at 02:19:14PM +0000, Måns Andersson wrote:
> Hi,

> It seems that the linux-ti-staging kernel does not have support for nand 
> flash on the am335x-evm board. I have tested both the default ti2013.04.00 
> tag and the latest from the ti-linux-3.8.y branch on the ti-linux-kernel* 
> repository without luck.
> 
> Searching on google gives me the following patch for the linux-omap* kernel 
> https://patchwork.kernel.org/patch/2624081/. Applying this patch (and the 
> other two from the same series) on the ti-linux-kernel does not work either, 
> there is probably some driver missing or configuration needed. Is there 
> something trivial I've missed, or should I try to compile the linux-omap 
> kernel with the above patches instead?
> 
> It seems that the linux-ti-staging kernel was not ready for prime time when 
> it was selected as the default kernel for the am335x boards. Since the board 
> bring up process differs between the 3.2 and 3.8 kernel (device tree) it 
> would be really appreciated if there were working configuration examples for 
> the development boards supplied by TI. Does TI have a public roadmap of when 
> the 3.8 kernel will have full support for their own boards?

Måns,

There are few known gaps in linux-ti-staging 3.8 kernel compared to the old 
PSP 3.2 kernel, as it relates to am335x. Moreover, ti2013.04.00 release was 
specific to omap5. If you need am335x feature completeness now, you can always 
use 3.2 kernel by setting PREFERRED_PROVIDER and PREFERRED_VERSION in your 
config. Going forward, the gaps will be closed in mainline.

-- 
Denys

