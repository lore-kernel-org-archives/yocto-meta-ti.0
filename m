Return-Path: <eyalr@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A65F8E00D14; Sun,  3 Dec 2017 02:34:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88110E00B54
	for <meta-ti@yoctoproject.org>; Sun,  3 Dec 2017 02:34:35 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB3AYPlZ007775
	for <meta-ti@yoctoproject.org>; Sun, 3 Dec 2017 04:34:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512297265;
	bh=VSCyWtr3JqjD5dgHIw/y7a7Oaz4xAEPtPpuVEr3ACzc=;
	h=From:To:CC:Subject:Date;
	b=SyE3xuQqwJBITbikWDWZgv9Wiu/07JlsWUwBGUiRRVJqGDCyoCAGlza+7t11UjtWS
	+LZEq393AlUOkH7AK+C2YRVws1G/ebIPMeYNfdwYOxMeRuePjKTBhEn3bUYJF1G7cu
	lN5zR+nS6597XiCADQ68KYte0TaUkbFFP5qVUWTE=
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB3AYJsO007342
	for <meta-ti@yoctoproject.org>; Sun, 3 Dec 2017 04:34:19 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0294.000; Sun, 3 Dec 2017 11:34:18 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH 0/4] wl18xx: add recipes for building R8.7_SP3
Thread-Index: AdNsIj9ajqUK6XFgQjmkn+43JNmyyQ==
Date: Sun, 3 Dec 2017 10:34:17 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364A8544@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.94]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH 0/4] wl18xx: add recipes for building R8.7_SP3
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
X-List-Received-Date: Sun, 03 Dec 2017 10:34:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

R8.7_SP3 contains WPA2 vulnurability fixes.

Fixes: LCPD-11124

Eyal Reizer (4):
  wl18xx-fw: add recipe for version R8.7_SP3
  wl18xx-calibrator: add recipe for version R8.7_SP3
  wl18xx-target-scripts: add recipe for version R8.7_SP3
  wlconf: add recipe for version R8.7_SP3

 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb           | 26 +++++++++++++++
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb   | 24 +++++++++++++
 .../wl18xx-target-scripts_8.7.3.bb                 | 22 ++++++++++++
 recipes-connectivity/wlconf/wlconf_8.7.3.bb        | 39 ++++++++++++++++++=
++++
 4 files changed, 111 insertions(+)
 create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
 create mode 100644 recipes-connectivity/wl18xx-calibrator/wl18xx-calibrato=
r_8.7.3.bb
 create mode 100644 recipes-connectivity/wl18xx-target-scripts/wl18xx-targe=
t-scripts_8.7.3.bb
 create mode 100644 recipes-connectivity/wlconf/wlconf_8.7.3.bb

--=20
2.7.4


