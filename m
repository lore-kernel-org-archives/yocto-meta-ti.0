Return-Path: <Rainer.Koenig@ts.fujitsu.com>
Received: from dgate20.ts.fujitsu.com (dgate20.ts.fujitsu.com [80.70.172.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C104E00735
	for <meta-ti@yoctoproject.org>; Thu, 24 Nov 2011 03:37:43 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1536-bit key; insecure key) header.i=Rainer.Koenig@ts.fujitsu.com;
	x-dkim-adsp=none (insecure policy)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	CC:Subject:References:In-Reply-To:X-Enigmail-Version:
	Content-Type:Content-Transfer-Encoding;
	b=opgAZm96C4Gqc7AokOK3Ac10FzfkdbggdyArvzyoFT81yMiw4X9TRNE6
	nGX9GdlVrkXOTsQ5DVpexTg1vB4Vku5foQlWPIaBh8/bV0ms8pvTFhlSn
	U84bs2W0c5rNOslMC1V34Lhswicqj8hp3AvG8LhSUZwIMywrd0HSMLrnP
	cMpKO7hQ0NpkerfSmM2F5j9BnIOQhFaN8hRenMuufdkvwymFZqaPn3Fds
	lGX2mmsG9BkBMxBhcoYw4Tb8nxFbc;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1322134664; x=1353670664;
	h=message-id:date:from:mime-version:to:cc:subject:
	references:in-reply-to:content-transfer-encoding;
	bh=cZVYLnNOhUmzoBfZBsQL02AaB9isL9xFudXgHy4zgs8=;
	b=r69wYR29T3K/WboPfAGhk15PyQZSe8pWu4Ta7LB0FuqrjA1pMv2UWJse
	hOPXtx6aKzSh6Zh4zb2Cl4OZ/2cvejT8Rrq5ur0ONeo/uCxGvSmVknB5w
	6vJBJsaNtD9NhE4AMawe/UBMHE5p4N++VlO+t75eGWMS0c3GH6ziagvId
	yXf2Wb34Rz1FwLNJYf+K8DALUZNJGsHLIK0tisTTk7J9mVyBpjypauRtB
	l6LkQuahqTMS5f7m0o930pqPLMO5F;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.69,564,1315173600"; d="scan'208";a="79798625"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 24 Nov 2011 12:37:40 +0100
X-IronPort-AV: E=Sophos;i="4.69,563,1315173600"; d="scan'208";a="124086915"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 24 Nov 2011 12:37:40 +0100
Message-ID: <4ECE2C84.5090202@ts.fujitsu.com>
Date: Thu, 24 Nov 2011 12:37:40 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: Gary Thomas <gary@mlbassoc.com>
References: <4ECDFB92.10203@ts.fujitsu.com> <4ECE25CD.9090105@mlbassoc.com>
In-Reply-To: <4ECE25CD.9090105@mlbassoc.com>
X-Enigmail-Version: 1.0.1
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: SRC_URI points to local domain:
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
X-List-Received-Date: Thu, 24 Nov 2011 11:37:44 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Am 24.11.2011 12:09, schrieb Gary Thomas:

>> $ find -type f | xargs grep SRC_URI | grep "local/"
>> ./recipes-ti/hdvpss/ti-hdvpss.inc:SRC_URI =
>> "http://install.source.dir.local/REL.HDVPSS.${PV}.zip"
>> ./recipes-ti/devtools/ti-cgt6x.inc:SRC_URI =
>> "http://install.source.dir.local/ti_cgt_c6000_${PVwithdots}_setup_linux_x86.bin;name=cgt6xbin"
>> ./recipes-ti/devtools/ti-cgt470.inc:SRC_URI =
>> "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"

> Fetch the files yourself and place in your [local] downloads directory (DL_DIR)
> No need to change the recipe as OE will look there first.

Well, the 2 cgt files I was able to find at TI, but I have no download
URL for the REL.HDVPSS.${PV}.zip file. :-(

BTW: the version of ti_cgt_c6000... has different md5sums to what is
written in the recipe. Strange thing.

Regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html

