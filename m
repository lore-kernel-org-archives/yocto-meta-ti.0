Return-Path: <eyalr@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFF3DE00D69; Tue,  5 Dec 2017 01:27:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58BBFE00C97
	for <meta-ti@yoctoproject.org>; Tue,  5 Dec 2017 01:27:57 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB59Rv6D007589
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 03:27:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512466077;
	bh=fy0k5JLNmZFa2igUfVfmv2h+6/BIwRdWmcy1zUdLCmg=;
	h=From:To:CC:Subject:Date;
	b=NeiT7PpN8jf5KLMWhSfx5tCF6Te+I9c4VGa5P4qxCjIfCxX4RKxWtPku33jPzM+9+
	MOvPHu9f/pc2R3Db6IRR95hfAX8xCLXnZGrWDBZDn5JSuOKNZfjv15SWFydSxyZvYc
	vVJVCG9dasP8SRxy9jJoFBfsvIFwncX+vK+ydctI=
Received: from DFRE71.ent.ti.com (dfre71.ent.ti.com [10.167.188.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB59RuNi015119
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 03:27:57 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE71.ent.ti.com ([fe80::1d1a:fb50:7d9b:ab68%31]) with mapi id
	14.03.0294.000; Tue, 5 Dec 2017 10:27:56 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [v2 0/4] wl18xx: add recipes for building R8.7_SP3
Thread-Index: AdNtq0GnCsQpuAlOQFSayP3BYuXttA==
Date: Tue, 5 Dec 2017 09:27:55 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364AAE89@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.93]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [v2 0/4] wl18xx: add recipes for building R8.7_SP3
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
X-List-Received-Date: Tue, 05 Dec 2017 09:27:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

R8.7_SP3 contains WPA2 vulnurability fixes.

Fixes: LCPD-11124

Eyal Reizer (4):
  wl18xx-fw: update recipe for version R8.7_SP3
  wl18xx-calibrator: update recipe for version R8.7_SP3
  wl18xx-target-scripts: update recipe for version R8.7_SP3
  wlconf: update recipe for version R8.7_SP3

 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb           | 26 ---------------
 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb           | 26 +++++++++++++++
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.1.bb   | 24 -------------
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb   | 24 +++++++++++++
 .../wl18xx-target-scripts_8.7.1.bb                 | 22 ------------
 .../wl18xx-target-scripts_8.7.3.bb                 | 22 ++++++++++++
 recipes-connectivity/wlconf/wlconf_8.7.1.bb        | 39 ------------------=
----
 recipes-connectivity/wlconf/wlconf_8.7.3.bb        | 39 ++++++++++++++++++=
++++
 8 files changed, 111 insertions(+), 111 deletions(-)
 delete mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb
 create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
 delete mode 100644 recipes-connectivity/wl18xx-calibrator/wl18xx-calibrato=
r_8.7.1.bb
 create mode 100644 recipes-connectivity/wl18xx-calibrator/wl18xx-calibrato=
r_8.7.3.bb
 delete mode 100644 recipes-connectivity/wl18xx-target-scripts/wl18xx-targe=
t-scripts_8.7.1.bb
 create mode 100644 recipes-connectivity/wl18xx-target-scripts/wl18xx-targe=
t-scripts_8.7.3.bb
 delete mode 100644 recipes-connectivity/wlconf/wlconf_8.7.1.bb
 create mode 100644 recipes-connectivity/wlconf/wlconf_8.7.3.bb

--=20
2.7.4


