Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E789E00EA9; Fri, 16 Dec 2016 11:47:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D874E00EA6
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2016 11:47:32 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBGHAoZr008192
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2016 11:10:50 -0600
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBGHAnZt012864
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2016 11:10:50 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBGHAl2E027839
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2016 22:40:48 +0530
Received: from [172.22.216.9] (172.22.216.9) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Dec 2016 22:40:45 +0530
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
References: <b42ea890-eb48-477d-aadf-2106a8bc1a3f@email.android.com>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <58542006.3030607@ti.com>
Date: Fri, 16 Dec 2016 22:40:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <b42ea890-eb48-477d-aadf-2106a8bc1a3f@email.android.com>
X-Originating-IP: [172.22.216.9]
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Fri, 16 Dec 2016 19:47:38 -0000
Content-Type: multipart/alternative;
	boundary="------------050500040600070503010408"

--------------050500040600070503010408
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denys,

The license file has changed to reflect the addition of the new MJPEG 
Encoder.
There is no other change apart from that.

Let me know if I need to submit the v2 of the patch with the expanded 
description.

Regards
Karthik

On 16-Dec-16 10:17 PM, Dmytriyenko, Denys wrote:
> Please briefly explain in the description the change in license 
> checksum and where it affects the license itself. Thanks.
>
> On Dec 16, 2016 11:44, "R, Karthik" <karthik.ramanan@ti.com> wrote:
>
>     This will include the following updates:
>      * Addition of MJPEG Encoder
>      * minor bug fixes
>      * codec updates for mpeg2d
>
>     Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>     ---
>      recipes-bsp/ipumm-fw/ipumm-fw_git.bb |    6 +++---
>      1 file changed, 3 insertions(+), 3 deletions(-)
>
>     diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>     b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>     index 4bebc2a..85dfc26 100644
>     --- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>     +++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>     @@ -9,7 +9,7 @@ python __anonymous() {
>      DESCRIPTION = "Firmware for IPU for supporting Accelerated MM
>     decode and encode"
>      LICENSE = "TI-TSPA"
>
>     -LIC_FILES_CHKSUM =
>     "file://Texas_Instruments_ipumm_Manifest.pdf;md5=e3e7d6efc7aca87789775198c4ca9f8e"
>     +LIC_FILES_CHKSUM =
>     "file://Texas_Instruments_ipumm_Manifest.pdf;md5=5cc572579f07af266ab57fc17d762c7f"
>
>      COMPATIBLE_MACHINE = "dra7xx"
>
>     @@ -17,12 +17,12 @@ RDEPENDS_${PN} = " libdce"
>
>      SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
>
>     -SRCREV = "cd93550ed32c7849de91288e7d90cba3bd89614b"
>     +SRCREV = "42fd71596b161e79e017e00741433e84705a28a6"
>
>      S = "${WORKDIR}/git"
>
>      PV = "3.00.12.00"
>     -PR = "r0"
>     +PR = "r1"
>
>      require recipes-ti/includes/ti-paths.inc
>      require recipes-ti/includes/ti-staging.inc
>     -- 
>     1.7.9.5
>
>     -- 
>     _______________________________________________
>     meta-ti mailing list
>     meta-ti@yoctoproject.org
>     https://lists.yoctoproject.org/listinfo/meta-ti
>
>


--------------050500040600070503010408
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <tt>Hi Denys,<br>
      <br>
      The license file has changed to reflect the addition of the new
      MJPEG Encoder.<br>
      There is no other change apart from that.<br>
      <br>
      Let me know if I need to submit the v2 of the patch with the
      expanded description.<br>
      <br>
      Regards<br>
      Karthik<br>
    </tt><br>
    <div class="moz-cite-prefix">On 16-Dec-16 10:17 PM, Dmytriyenko,
      Denys wrote:<br>
    </div>
    <blockquote
      cite="mid:b42ea890-eb48-477d-aadf-2106a8bc1a3f@email.android.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="auto">Please briefly explain in the description the
        change in license checksum and where it affects the license
        itself. Thanks.</div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Dec 16, 2016 11:44, "R, Karthik"
          <a class="moz-txt-link-rfc2396E" href="mailto:karthik.ramanan@ti.com">&lt;karthik.ramanan@ti.com&gt;</a> wrote:<br type="attribution">
          <blockquote class="quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div><font size="2"><span style="font-size:10pt"></span></font>
              <div>This will include the following updates:<br>
                 * Addition of MJPEG Encoder<br>
                 * minor bug fixes<br>
                 * codec updates for mpeg2d<br>
                <br>
                Signed-off-by: Karthik Ramanan <a class="moz-txt-link-rfc2396E" href="mailto:a0393906@ti.com">&lt;a0393906@ti.com&gt;</a><br>
                ---<br>
                 recipes-bsp/ipumm-fw/ipumm-fw_git.bb |    6 +++---<br>
                 1 file changed, 3 insertions(+), 3 deletions(-)<br>
                <br>
                diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
                b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb<br>
                index 4bebc2a..85dfc26 100644<br>
                --- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb<br>
                +++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb<br>
                @@ -9,7 +9,7 @@ python __anonymous() {<!-- --><br>
                 DESCRIPTION = "Firmware for IPU for supporting
                Accelerated MM decode and encode"<br>
                 LICENSE = "TI-TSPA"<br>
                 <br>
                -LIC_FILES_CHKSUM = "<a moz-do-not-send="true" href="">file://Texas_Instruments_ipumm_Manifest.pdf;md5=e3e7d6efc7aca87789775198c4ca9f8e</a>"<br>
                +LIC_FILES_CHKSUM = "<a moz-do-not-send="true" href="">file://Texas_Instruments_ipumm_Manifest.pdf;md5=5cc572579f07af266ab57fc17d762c7f</a>"<br>
                 <br>
                 COMPATIBLE_MACHINE = "dra7xx"<br>
                 <br>
                @@ -17,12 +17,12 @@ RDEPENDS_${PN} = " libdce"<br>
                 <br>
                 SRC_URI =
                <a class="moz-txt-link-rfc2396E" href="git://git.ti.com/ivimm/ipumm.git;protocol=git">"git://git.ti.com/ivimm/ipumm.git;protocol=git"</a><br>
                 <br>
                -SRCREV = "cd93550ed32c7849de91288e7d90cba3bd89614b"<br>
                +SRCREV = "42fd71596b161e79e017e00741433e84705a28a6"<br>
                 <br>
                 S = "${WORKDIR}/git"<br>
                 <br>
                 PV = "3.00.12.00"<br>
                -PR = "r0"<br>
                +PR = "r1"<br>
                 <br>
                 require recipes-ti/includes/ti-paths.inc<br>
                 require recipes-ti/includes/ti-staging.inc<br>
                -- <br>
                1.7.9.5<br>
                <br>
                -- <br>
                _______________________________________________<br>
                meta-ti mailing list<br>
                <a class="moz-txt-link-abbreviated" href="mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br>
                <a moz-do-not-send="true"
                  href="https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------050500040600070503010408--
