Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C061E008CD; Fri,  9 Jan 2015 07:41:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 509CFE0080C
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 07:41:10 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t09Ff7pY002963;
	Fri, 9 Jan 2015 09:41:07 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t09Ff7Pu002109;
	Fri, 9 Jan 2015 09:41:07 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 9 Jan 2015 09:41:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t09Ff7Jb006651;
	Fri, 9 Jan 2015 09:41:07 -0600
Date: Fri, 9 Jan 2015 10:41:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20150109154106.GI4759@edge>
References: <CAMCfZKH_-v_S=mLiNLQVRZ_YmUYZgz1a6q8h_ZX5VRqfwjiESQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKH_-v_S=mLiNLQVRZ_YmUYZgz1a6q8h_ZX5VRqfwjiESQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: pvrsrvkm failing on kernel 3.14.26 for am3359
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
X-List-Received-Date: Fri, 09 Jan 2015 15:41:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Diego,

The fix finally got merged to the kernel yesterday and will be picked up by 
the recipe update I posted last night.

-- 
Denys


On Fri, Jan 09, 2015 at 08:41:19AM -0200, Diego Sueiro wrote:
> Folks,
> 
> I have recently updated my meta-ti daisy branch and noticed that
> omap3-sgx-modules are not being loaded.
> 
> Here is the log for 3.14.26 kernel (from meta-ti commit
> 1d46274416c3b50808590963bdb6c157d9d7c745):
> 
> pvrsrvkm: Unknown symbol v7_dma_map_area (err 0)
> pvrsrvkm: Unknown symbol v7_dma_flush_range (err 0)
> insmod: ERROR: could not insert module
> /lib/modules/3.14.26/kernel/drivers/gpu/pvr/pvrsrvkm.ko: Unknown symbol in
> module
> Could not find pvrsrvkm driver
> 
> 
> The 3.14.25 kernel version (from meta-ti commit
> 31348244882a8defb640af75119ba275d9915f09) is OK.
> 
> I'm using the default kernel configuration.
> 
> 
> Regards,
> 
> --
> *dS
> Diego Sueiro
> 
> Administrador do Embarcados
> www.embarcados.com.br
> <http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
> 
> /*long live rock 'n roll*/

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


