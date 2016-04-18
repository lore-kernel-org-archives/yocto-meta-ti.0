Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94190E00D81; Mon, 18 Apr 2016 09:19:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56E40E00C1D
	for <meta-ti@yoctoproject.org>; Mon, 18 Apr 2016 09:19:29 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3IGJJ4G009488;
	Mon, 18 Apr 2016 11:19:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3IGJJiX010048;
	Mon, 18 Apr 2016 11:19:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 Apr 2016 11:19:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3IGJJkg011734;
	Mon, 18 Apr 2016 11:19:19 -0500
Date: Mon, 18 Apr 2016 12:19:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Message-ID: <20160418161903.GO10048@edge>
References: <5714A737.4030504@bytesatwork.ch>
MIME-Version: 1.0
In-Reply-To: <5714A737.4030504@bytesatwork.ch>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: omap3-sgx-modules for ti kernel 4.1/4.4?
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
X-List-Received-Date: Mon, 18 Apr 2016 16:19:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 18, 2016 at 11:21:59AM +0200, Daniel Ammann wrote:
> Hi
> 
> Is there going to be a new version of the accelerated sgx sdk
> (omap3-sgx-modules_5.01.01.02.bb) that works with ti 4.1 or 4.4 kernel 
> on am335x?

No, omap3-sgx-modules will not be updated, as it has been deprecated and 
replaced by omapdrm-pvr long time ago.


> I think ti 4.1/4.4 kernel will be released for yocto 2.1/krogoth?

4.1 was released on fido/1.8 and 4.4 will be on krogoth/2.1


> As far as I can tell the current recipe only works with 3.14 kernel.

Yes, since at least 3.18 omapdrm-pvr was the driver used for SGX.

-- 
Denys

