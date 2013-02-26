Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 67695E002AB
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 18:18:49 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1Q2IlOJ003278;
	Mon, 25 Feb 2013 20:18:47 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1Q2IlZ2008620;
	Mon, 25 Feb 2013 20:18:47 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 25 Feb 2013 20:18:46 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1Q2Ikwk024832;
	Mon, 25 Feb 2013 20:18:46 -0600
Date: Mon, 25 Feb 2013 21:18:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130226021845.GD17751@edge>
References: <1361138432-18908-1-git-send-email-fcooper@ti.com>
	<20130226014414.GE6725@denix.org>
	<1062C227-A018-4C33-8071-417E7C256AA9@ti.com>
MIME-Version: 1.0
In-Reply-To: <1062C227-A018-4C33-8071-417E7C256AA9@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-omap3: Add supported kernel recipe for am37x-evm and am3517-evm
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
X-List-Received-Date: Tue, 26 Feb 2013 02:18:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 25, 2013 at 09:16:43PM -0500, Cooper Jr., Franklin wrote:
> Glancing at your recipe it looks the same.
> 
> I must of missed your version. The kernel hasn't changed so they should be 
> identical. Let me double check with a quick diff

Please do. I only see minor diffs (commit ID vs. tag, some order diff etc).

-- 
Denys

