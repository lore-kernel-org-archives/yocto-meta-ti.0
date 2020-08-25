Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.114.1598374485717033366
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2020 09:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=edtdZWmK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PGsi2S099031
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2020 11:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598374484;
	bh=6GZxWLxbxDGpLwqn6r1NSdII8m6n2+bXQbrbrPBB6dc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=edtdZWmKD4FXf3p6ENDxeFB0W8TcU7tEqC0eWhmdpu3+M71gq9Z2V35kjxPgjM3z9
	 q0svnmJ1eSIG/YXE4kaef11qQtDkIwlT070fZpvkp3NgJLyYW3LL9uZPFdxAFQRpQ1
	 Bp3GKeEx3Xl7UhrqMRY72NxjQ0u9ihAOT9R0OQ+4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PGsi3r093169
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2020 11:54:44 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 11:54:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 11:54:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PGsiwB005987;
	Tue, 25 Aug 2020 11:54:44 -0500
Date: Tue, 25 Aug 2020 12:54:44 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Lokesh Vutla <lokeshvutla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sekhar Nori <nsekhar@ti.com>,
        <m-erdahl@ti.com>, <m-karicheri2@ti.com>
Subject: Re: [PATCH 1/3] prueth-hsr/prp: Update hsr/prp firmwares to latest
Message-ID: <20200825165444.GB23638@beryl>
References: <20200821073238.18926-1-lokeshvutla@ti.com>
 <20200821073238.18926-2-lokeshvutla@ti.com>
 <20200821184002.GJ29812@beryl>
 <549e7999-cf7a-d7b6-7b69-0f436c7e71e7@ti.com>
MIME-Version: 1.0
In-Reply-To: <549e7999-cf7a-d7b6-7b69-0f436c7e71e7@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Aug 23, 2020 at 03:10:20PM +0530, Lokesh Vutla wrote:
> Hi Denys,
> 
> On 22/08/20 12:10 am, Denys Dmytriyenko wrote:
> > On Fri, Aug 21, 2020 at 01:02:36PM +0530, Lokesh Vutla wrote:
> >> Update the hsr/prp firmwares to latest that includes support for
> >> timestamping rx packets. Unfortunately version number is not
> >> incremented for this update.
> >>
> >> Also rename the bb file to add PV in it.
> > 
> > This is fine, but you need to choose which one provides the correct PV. 
> > Currently you have it duplicated:
> > 
> > pruhsr-fw_2.15.23.bb will set PV = "2.15.23" automatically from the filename, 
> > but you also have existing PV = "2.15.23" inside the recipe. Same for other 
> > recipe.
> > 
> > The recommendation is to set PV in the filename for released tarballs.
> > 
> > When the code is pulled directly from git, it is acceptable (and sometimes 
> > even preferred) to use _git in the filename and set PV explicitly inside the 
> > recipe. And if you expect these to be updated regularly, you can avoid churn 
> > of renaming the recipe with the new version. Also that's preferred for 
> > packages (probably not in this case) that need to be AUTOREV-ed to the latest 
> > for any nightly CI atuomation...
> 
> Thanks for the explanation. Will remove the duplicate inside the FILE. Also what
> about PE and PR?

PE - Package Epoch, default "0"
PV - Package Version, default "0.0", but normally set in filename or recipe
PR - Package Revision, default "r0"

Normally PV comes from the component version. When there are any changes to 
the recipe, but PV stays the same, you want to bump the PR, though PR server 
does that function now and in most cases there's no need to do that manually.
And when the PV version goes backwards for some reason (re-version, downgrade 
or revert), then it is necessary to bump PE.


> Thanks and regards,
> Lokesh
> 
> > 
