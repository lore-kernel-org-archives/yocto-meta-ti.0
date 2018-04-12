Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F5DBE00816; Thu, 12 Apr 2018 09:51:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F9C7E00816
	for <meta-ti@yoctoproject.org>; Thu, 12 Apr 2018 09:51:35 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3CGpZpo023436;
	Thu, 12 Apr 2018 11:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523551895;
	bh=3x3Qal0TiqZI5t4VJENkbkIP50YkfwGFU2v/Gkt3VcQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SKadD+UoCfvXQRfoKJJ3BQJabG2Rmx+jXpFWqjSWfZK+C5ZFOcg/9SnXJllfFFiyU
	9x2IQ9ac3oPilaZsGPzr28rUG9vNbBixqviJM0qd+YILrnBfR3BJYkHHAAfrAIxjKb
	BcM1m2drPd63tdmUt0Ll+4yUNiaRQ3MWTAw0Tvo8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3CGpZSA005058;
	Thu, 12 Apr 2018 11:51:35 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 12 Apr 2018 11:51:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 12 Apr 2018 11:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3CGpYIf016570;
	Thu, 12 Apr 2018 11:51:34 -0500
Date: Thu, 12 Apr 2018 12:51:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20180412165134.GI4939@edge>
References: <20180402194728.21389-1-JPEWhacker@gmail.com>
	<20180402202008.GD27229@edge> <1522702824.2942.13.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1522702824.2942.13.camel@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/rocko/master][PATCH] ti-pdk: Weakly assign PARALLEL_XDC
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
X-List-Received-Date: Thu, 12 Apr 2018 16:51:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 02, 2018 at 04:00:24PM -0500, Joshua Watt wrote:
> On Mon, 2018-04-02 at 16:20 -0400, Denys Dmytriyenko wrote:
> > On Mon, Apr 02, 2018 at 02:47:28PM -0500, Joshua Watt wrote:
> > > Allowing it to be overridden in local.conf
> > 
> > Why?
> 
> For some reason, when some ti-pdk recipes are built on my machine, the
> number of threads explodes exponentially.... It ends up launching
> several hundreds to thousands of threads which consequently make my
> computer unresponsive for quite a while, and I usually have to reboot
> it afterwards because something important stopped working.
> 
> I think for some reason the --jobs= flag is getting compounded
> recursively.
> 
> Admittedly, there appears to be some deeper bug with the job
> parallelism that needs to be looked into, but this at least allows me
> to continue working (by setting PARALLEL_XDC = "" in local.conf) in the
> meantime.
> 
> I'm on the latest HEAD of morty BTW.

Do you only see this behavior on morty? What about rocko/master?

I've asked around and we don't see this issue internally and we do a lot of 
builds in our build farm on a daily basis...

Since this is otherwise a harmless change, I don't mind merging it. Please let 
me know if you actually do need it in all 3 branches. Thanks.


> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  classes/ti-pdk.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> > > index 540a665c..0b0c9ffe 100644
> > > --- a/classes/ti-pdk.bbclass
> > > +++ b/classes/ti-pdk.bbclass
> > > @@ -63,7 +63,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
> > >  
> > >  TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
> > >  
> > > -PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
> > > +PARALLEL_XDC ?= "--jobs=${BB_NUMBER_THREADS}"
> > >  PARALLEL_MAKE = ""
> > >  
> > >  def get_doxygen_support(d):
> > > -- 
> > > 2.14.3
> > > 
> > > -- 
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

