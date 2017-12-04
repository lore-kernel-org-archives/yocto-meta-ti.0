Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AFDFE00D68; Mon,  4 Dec 2017 12:15:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EAEEE00D00
	for <meta-ti@yoctoproject.org>; Mon,  4 Dec 2017 12:15:14 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB4KFD4q005698
	for <meta-ti@yoctoproject.org>; Mon, 4 Dec 2017 14:15:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512418513;
	bh=+/GAdRNGnSzIowNXsyTtWPmUWIn6O2bBGUSkLvF+RsE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=myBgB5zmJ6s8NbrCS/6DbnYtezng0kjvT0hkBFHmAbQwh4hZexQrJ2M+rzaDngyIP
	MTyTXygQOK28WU/KBaNoDcWFANeMHIpTQ17lLtr1lE5C/SH2YT0zDsPrJnKtBjUN6N
	jZCVKCkA4BzVYAyY+42n3HevSxnf1dPn5hBAqrA0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4KFDfb007016
	for <meta-ti@yoctoproject.org>; Mon, 4 Dec 2017 14:15:13 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 4 Dec 2017 14:15:13 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 4 Dec 2017 14:15:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4KFDaF025349;
	Mon, 4 Dec 2017 14:15:13 -0600
Date: Mon, 4 Dec 2017 15:14:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>
Message-ID: <20171204201457.GH15340@edge>
References: <8665E2433BC68541A24DFFCA87B70F5B364A8553@DFRE01.ent.ti.com>
	<20171204195150.GC15340@edge>
	<hag6ew6a30h2gy5qyw3kmwbv.1512417280049@email.android.com>
MIME-Version: 1.0
In-Reply-To: <hag6ew6a30h2gy5qyw3kmwbv.1512417280049@email.android.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/4] wl18xx-fw: add recipe for version R8.7_SP3
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
X-List-Received-Date: Mon, 04 Dec 2017 20:15:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eyal,

Usually, git history is enough. Multiple recipe versions are only needed when 
they can be used at the same time or switch between them in the same release.

We have some extra time to get this fixed until tomorrow noon before the next 
tag, so feel free to re-submit v2 by then. If not, I'll get to fix it myself 
tomorrow. Thanks.

-- 
Denys


On Mon, Dec 04, 2017 at 02:54:44PM -0500, Reizer, Eyal wrote:
>    Hi Denys,
> 
>    Yes, of course. Thought you were keeping the history.
>    Can you take care of it or do you need another patch set?
> 
>    Best Regards,
>    Eyal
> 
>    -------- Original Message --------
>    From: "Dmytriyenko, Denys" <denys@ti.com>
>    Date: Mon, Dec 4, 2017, 21:52
>    To: "Reizer, Eyal" <eyalr@ti.com>
>    CC: meta-ti@yoctoproject.org
>    Subject: Re: [PATCH 1/4] wl18xx-fw: add recipe for version R8.7_SP3
> 
>    On Sun, Dec 03, 2017 at 05:34:49AM -0500, Reizer, Eyal wrote:
>    > Signed-off-by: Eyal Reizer <eyalr@ti.com>
>    > ---
>    >  recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 26
>    ++++++++++++++++++++++++++
>    >  1 file changed, 26 insertions(+)
>    >  create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> 
>    Thanks! Can we just update from 8.7.1 to 8.7.3 by replacing the recipe,
>    instead of adding new one?
> 
>    > diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
>    b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
>    > new file mode 100644
>    > index 0000000..a52ec89
>    > --- /dev/null
>    > +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
>    > @@ -0,0 +1,26 @@
>    > +DESCRIPTION = "Firmware files for use with TI wl18xx"
>    > +LICENSE = "TI-TSPA"
>    > +LIC_FILES_CHKSUM =
>    "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
>    > +
>    > +SRC_URI = " \
>    > +    
>    git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH}
>    \
>    > +     file://0001-Add-Makefile-to-install-firmware-files.patch \
>    > +"
>    > +
>    > +# Tag: R8.7-SP3 (8.7.3)
>    > +SRCREV = "f659be25473e4bde8dc790bff703ecacde6e21da"
>    > +BRANCH = "master"
>    > +
>    > +S = "${WORKDIR}/git"
>    > +
>    > +CLEANBROKEN = "1"
>    > +
>    > +do_compile() {
>    > +    :
>    > +}
>    > +
>    > +do_install() {
>    > +    oe_runmake 'DEST_DIR=${D}' install
>    > +}
>    > +
>    > +FILES_${PN} = "/lib/firmware/ti-connectivity/*"
>    > --
>    > 2.7.4
>    >

