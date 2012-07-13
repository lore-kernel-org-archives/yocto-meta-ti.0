Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A159BE0027D
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2012 16:30:22 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6DNUKLc011108;
	Fri, 13 Jul 2012 18:30:20 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6DNUKej019476;
	Fri, 13 Jul 2012 18:30:20 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 13 Jul 2012 18:30:20 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6DNUKVi022650;
	Fri, 13 Jul 2012 18:30:20 -0500
Date: Fri, 13 Jul 2012 19:30:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Message-ID: <20120713233018.GA24499@edge>
References: <CADZ6=avGWT=-4vLVs3VOW6dx1kmuo_qyP7jdkQiroM-UXZi06A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADZ6=avGWT=-4vLVs3VOW6dx1kmuo_qyP7jdkQiroM-UXZi06A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: netbase-4.47 vs. -5.0 build breakage
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 23:30:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 13, 2012 at 04:47:22PM +0200, Thilo Fromm wrote:
> Hi guys,
> 
> is anything happening to fix the current build breakage against
> oe-core? oe-core moved on to netbase-5.0, meta-texasinstruments is
> still referring to netbase-4.47 with a .bbappend. Andreas M??ller
> submitted a patch on 9th of July which fixes this. Please apply the
> patch; currently the meta-ti build is broken.

Thilo,

People do have vacations, you know, hence the 4-day delay. It is now in.

--
Denys

