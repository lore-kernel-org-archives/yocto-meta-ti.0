Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2719.1582589355327965255
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 16:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AMGSVC2a;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01P09DA5032244;
	Mon, 24 Feb 2020 18:09:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582589353;
	bh=G0YfbvTiCc508eMPE8O8S5TftGIiyYupyTapEanJU8g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AMGSVC2aXtz8tBbR1U0dnkfZzVhJtDGMROzWq0pjOJSkwQsDK6fRkxpSgs43k+5vQ
	 sU1xfwtylQQLa1aNjtrWCyvKS6AoI+U/bK3x5T9qiL/PbNhAjjullKen/WOMTBKBWw
	 c9T1SndCS1JD7IdwY9KoGoaS6eb4OOz00Enmr9pE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01P09DJW043671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2020 18:09:13 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 18:09:12 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 18:09:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01P09Caf062771;
	Mon, 24 Feb 2020 18:09:12 -0600
Date: Mon, 24 Feb 2020 19:09:12 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] issues with fetching git repos from git.ti.com
Message-ID: <20200225000912.GM22205@beryl>
References: <CAFMvBt2_TZd4Xid-nJxNYkp_OThisAFJFGfwT7Y5NqE4qU06Kg@mail.gmail.com>
 <2596.1578907543790978429@lists.yoctoproject.org>
 <CAM9ZRVtT-8My0U+cem=O-BjK_WD6tG5fAto18x73qgooAMZNzw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVtT-8My0U+cem=O-BjK_WD6tG5fAto18x73qgooAMZNzw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 24, 2020 at 08:38:56PM +0000, Paul Barker wrote:
> This happens pretty often for me, for example today:
> 
>     Cloning into bare repository
> '/b/Sancloud/agl-master/demo-vayu/downloads/git2/git.ti.com.ivimm.ipumm.git'...
>     fatal: unable to connect to git.ti.com:
>     git.ti.com[0: 198.47.28.207]: errno=Connection timed out
> 
>     ERROR: ipumm-fw-3.00.15.00-r5 do_fetch: Fetcher failure for URL:
> 'git://git.ti.com/ivimm/ipumm.git;protocol=git'. Unable to fetch URL
> from any source.
> 
> Is there anything that can be done about this?

Yes, this is being looked at.

Denys

> On Mon, 13 Jan 2020 at 09:25, <linus.brandett@gmail.com> wrote:
> >
> > Hi,
> >
> > I dont want to hijack this thread but just to say that I have the same problem and Im located in Sweden.
> >
> > fatal: unable to connect to git.ti.com:
> > git.ti.com[0: 198.47.28.207]: errno=Connection timed out
> >
> > Running git from terminal usually works better but not always.
> >
> > Its only TIs git servers thats causing problems, others work fine.
> >
> > /Linus 

> 

