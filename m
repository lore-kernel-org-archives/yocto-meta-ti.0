Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74D5AE007EB; Wed, 22 Oct 2014 11:00:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44235E00799
	for <meta-ti@yoctoproject.org>; Wed, 22 Oct 2014 11:00:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9MI0Hqs024662
	for <meta-ti@yoctoproject.org>; Wed, 22 Oct 2014 13:00:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9MI0HS6007334
	for <meta-ti@yoctoproject.org>; Wed, 22 Oct 2014 13:00:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 22 Oct 2014 13:00:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9MI0Hkm004898;
	Wed, 22 Oct 2014 13:00:17 -0500
Date: Wed, 22 Oct 2014 14:00:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20141022180016.GO25408@edge>
References: <1413213179-7250-1-git-send-email-a0393906@ti.com>
	<1413213179-7250-2-git-send-email-a0393906@ti.com>
	<20141022164834.GK25408@edge> <5447EFA0.8090909@ti.com>
MIME-Version: 1.0
In-Reply-To: <5447EFA0.8090909@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [master PATCH v2 1/1] ipumm-fw: Updated ipumm firmware for latest IPC version
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
X-List-Received-Date: Wed, 22 Oct 2014 18:00:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 22, 2014 at 11:25:44PM +0530, Karthik Ramanan wrote:
> On 22-Oct-14 10:18 PM, Denys Dmytriyenko wrote:
> >On Mon, Oct 13, 2014 at 08:42:59PM +0530, Karthik Ramanan wrote:
> >>* This includes the error handling support.
> >>* Minor bug fixes
> >
> >Karthik,
> >
> >Quick question - is there a separate download link for am57xx-evm or should
> >dra7xx-evm one be used for it?
> >
> Denys,
> 
> I believe that the same can be reused for am57xx-evm. We don't have
> a separate download link for the am57xx-evm.
> 
> Since the IPUMM binary was only used for dra7xx-evm until now the
> naming makes it sound like its specific to dra7xx-evm, we should
> change this going ahead.

Thanks. I sent out v3 of your patch with the modifications to allow am57xx-evm 
to be built using the same dra7xx-evm binary - please provide any feedback. 
And I agree we should look into naming it properly in the future.

-- 
Denys

