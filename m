Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.52.1574703727371977933
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 09:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CdBivZxe;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3688AE00FCC; Mon, 25 Nov 2019 09:42:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA234E00F78
	for <meta-ti@yoctoproject.org>; Mon, 25 Nov 2019 09:42:06 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPHg5jT112192;
	Mon, 25 Nov 2019 11:42:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574703725;
	bh=fRsajaT2uNpvgBa5O2WziUa8I+ixihjZZKy2/mtH9h8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CdBivZxe1K5MnbOMi7fzjjSNJxX3YNw1v44r6Wk6u/VG9wk1sf3aHANsnyqjloet5
	 duAt1FKRbMcWzKTrRQM/rp6vazG4rOJPlicc+9JrQiuh/Yb4a93ObleZJETcBfqAr/
	 fjdSLph9WBdx+jisiHnhswt9XcGRpuM1+P2mDnas=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPHg5It088501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Nov 2019 11:42:05 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 11:42:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 11:42:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPHg4XA060489;
	Mon, 25 Nov 2019 11:42:05 -0600
Date: Mon, 25 Nov 2019 12:42:04 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
CC: Khem Raj <raj.khem@gmail.com>, <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] [master/thud][PATCH 01/42] ti-pdk-fetch: add class for common pdk sources
Message-ID: <20191125174203.GC4706@beryl>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
 <1573830902-17409-2-git-send-email-j-stiffler@ti.com>
 <17d4428990ced5db9ea54f695950c868bd7a50cd.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <17d4428990ced5db9ea54f695950c868bd7a50cd.camel@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 15, 2019 at 09:14:15AM -0800, Khem Raj wrote:
> On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:
> > Recently individual components and LLD sources have been combined
> > into a single PDK repo. Use this class to specify the common source.
> > Also use this class to keep the sources separate from each other when
> > building. This keeps the build identical to previous recipes while
> > keeping control on interdependencies.
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
...
> > +# Extract only required sources from PDK
> > +python do_unpack_append() {
> > +    if len(d.getVar('TI_PDK_COMP') or '') > 0:
> > +        import subprocess
> > +
> > +        src =
> > os.path.join(d.getVar('TI_PDK_SRC'),'packages',d.getVar('TI_PDK_COMP_
> > PATH'))
> > +
> > +        # Package up only the required sources
> > +        cmd = 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (src,
> > d.getVar('S'))
> > +        subprocess.check_output(cmd, shell=True,
> > stderr=subprocess.STDOUT)
> > +
> > +        bb.utils.remove(d.getVar('TI_PDK_SRC'), recurse=True)
> > +}
> 
> perhaps looking in work-shared idea from kernel or gcc or clang
> packages could make it better where, you only untar sources once

Jake,

Any updates on this - will you be looking into the above suggestion?

-- 
Denys
