Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A45BEE00832; Mon, 24 Nov 2014 09:43:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59A42E005B7
	for <meta-ti@yoctoproject.org>; Mon, 24 Nov 2014 09:43:25 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAOHhOtl001150;
	Mon, 24 Nov 2014 11:43:24 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAOHhO0I008906;
	Mon, 24 Nov 2014 11:43:24 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 24 Nov 2014 11:43:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAOHhNGa001741;
	Mon, 24 Nov 2014 11:43:23 -0600
Date: Mon, 24 Nov 2014 12:43:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20141124174322.GB2242@edge>
References: <CAMCfZKFbTOszNMe+5PdP29x_eJmwNmykwdFVxynh-3fijcGWZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFbTOszNMe+5PdP29x_eJmwNmykwdFVxynh-3fijcGWZQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: AM1705 support
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
X-List-Received-Date: Mon, 24 Nov 2014 17:43:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Nov 24, 2014 at 03:10:50PM -0200, Diego Sueiro wrote:
> Folks,
> 
> I have a project with AM1705 processor and I couldn't found any specific
> machine configurations for it.
> 
> Looking at the link http://www.ti.com/tool/linuxezsdk-sitara when I try to
> download it's SDK it points me to download AM18x SDK (
> http://software-dl.ti.com/sitara_linux/esd/AM17xSDK/latest/index_FDS.html).
> 
> So, the question is. Is the AM1705 SDK and AM18x SDK the same?

Yes, AM17x and AM18x are very similar - they use OMAP-L137 and OMAP-L138 parts 
respectively. The differences are mostly in peripherals:

http://www.ti.com/product/omap-l137
http://www.ti.com/product/omap-l138

From BSP perspective, you can use am180x-evm machine.

-- 
Denys

