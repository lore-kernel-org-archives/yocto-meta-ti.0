Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F842E0088B; Tue, 15 Dec 2015 08:09:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCB64E00546
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 08:09:20 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBFG9KuT025038
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 10:09:20 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFG9J1V017636
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 10:09:20 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Dec 2015 10:09:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFG9JFE019475;
	Tue, 15 Dec 2015 10:09:19 -0600
Date: Tue, 15 Dec 2015 11:09:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20151215160903.GF23133@edge>
References: <1449825558-1294-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1449825558-1294-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [SGX AM57x/DRA7xx 0/2] Update SGX graphics recipes for AM57x/DRA7xx to latest version
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
X-List-Received-Date: Tue, 15 Dec 2015 16:09:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Dec 11, 2015 at 02:49:16PM +0530, Anand Balagopalakrishnan wrote:
> Update SGX UM / KM to latest version for AM57x/DRA7xx
> 
> The changes involved have been tested against 4.1 kernel (commit -
> 03066ae73fc380e3ea9da8cba63591a135b33b71) with GLSDK 7.02 GA /
> 2014 LTS file system. The Yocto recipes have not been verified on 2015 LTS.

Is this for 2015.02? Considering that is hasn't been validated on 2015LTS and 
that we are just days away from the release, this seems risky to push at this 
time...

-- 
Denys


> Summary of changes
> ==================
> UM:
> - Enable screenshot capture in Weston
> - Resolve SGX HW recovery when Wayland OpenGLES clients are abruptly terminated
> - Resolve SGX HW recovery with glmark2 benchmark application
> - Resolve rendering issue with half float textures
> 
> KM:
> - Fix access to freed memory
> - Fix GEM handle memory leak when Wayland client exit and Weston continues to run
> 
> Anand Balagopalakrishnan (2):
>   omapdrm-pvr: bump SRCREV for AM57x/DRA7xx
>   omap5-sgx-ddk-um-linux: bump SRCREV for AM57x/DRA7xx to the latest
>     DDK UM
> 
>  .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    2 +-
>  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

