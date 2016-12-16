Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2768BE00DC2; Fri, 16 Dec 2016 09:36:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 230A4E00DA7
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2016 09:36:21 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBGHaLrh018304
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2016 11:36:21 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBGHaLlk007511
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2016 11:36:21 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Dec 2016 11:36:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBGHaKou014197;
	Fri, 16 Dec 2016 11:36:20 -0600
Date: Fri, 16 Dec 2016 12:36:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20161216173619.GN28380@edge>
References: <012b8cea-868d-4c7c-8477-f4428f88323f@email.android.com>
	<5854214D.7040901@ti.com>
MIME-Version: 1.0
In-Reply-To: <5854214D.7040901@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: [PATCH 1/2] ipumm-fw: Update SRCREV
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
X-List-Received-Date: Fri, 16 Dec 2016 17:36:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks!

On Fri, Dec 16, 2016 at 10:45:57PM +0530, Karthik Ramanan wrote:
> No. It doesn't. Double checked the license type between the old and
> new and it is the same.
> 
> Regards
> Karthik
> 
> On 16-Dec-16 10:42 PM, Dmytriyenko, Denys wrote:
> >Does that change the overall license in any way?
> >
> >On Dec 16, 2016 12:10, "R, Karthik" <karthik.ramanan@ti.com> wrote:
> >
> >    Hi Denys,
> >
> >    The license file has changed to reflect the addition of the new
> >    MJPEG Encoder.
> >    There is no other change apart from that.
> >
> >    Let me know if I need to submit the v2 of the patch with the
> >    expanded description.
> >
> >    Regards
> >    Karthik
> >
> >    On 16-Dec-16 10:17 PM, Dmytriyenko, Denys wrote:
> >
> >        Please briefly explain in the description the change in
> >        license checksum and where it affects the license itself. Thanks.
> >
> >        On Dec 16, 2016 11:44, "R, Karthik" <karthik.ramanan@ti.com>
> >        <mailto:karthik.ramanan@ti.com> wrote:
> >
> >            This will include the following updates:
> >             * Addition of MJPEG Encoder
> >             * minor bug fixes
> >             * codec updates for mpeg2d
> >
> >            Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> >            <mailto:a0393906@ti.com>
> >            ---
> >             recipes-bsp/ipumm-fw/ipumm-fw_git.bb |    6 +++---
> >             1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >            diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> >            b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> >            index 4bebc2a..85dfc26 100644
> >            --- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> >            +++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> >            @@ -9,7 +9,7 @@ python __anonymous() {
> >             DESCRIPTION = "Firmware for IPU for supporting
> >            Accelerated MM decode and encode"
> >             LICENSE = "TI-TSPA"
> >
> >            -LIC_FILES_CHKSUM =
> >            "file://Texas_Instruments_ipumm_Manifest.pdf;md5=e3e7d6efc7aca87789775198c4ca9f8e"
> >            +LIC_FILES_CHKSUM =
> >            "file://Texas_Instruments_ipumm_Manifest.pdf;md5=5cc572579f07af266ab57fc17d762c7f"
> >
> >             COMPATIBLE_MACHINE = "dra7xx"
> >
> >            @@ -17,12 +17,12 @@ RDEPENDS_${PN} = " libdce"
> >
> >             SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
> >
> >            -SRCREV = "cd93550ed32c7849de91288e7d90cba3bd89614b"
> >            +SRCREV = "42fd71596b161e79e017e00741433e84705a28a6"
> >
> >             S = "${WORKDIR}/git"
> >
> >             PV = "3.00.12.00"
> >            -PR = "r0"
> >            +PR = "r1"
> >
> >             require recipes-ti/includes/ti-paths.inc
> >             require recipes-ti/includes/ti-staging.inc
> >            --             1.7.9.5
> >
> >            --
> >_______________________________________________
> >            meta-ti mailing list
> >            meta-ti@yoctoproject.org <mailto:meta-ti@yoctoproject.org>
> >            https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
> >
> >
> 

