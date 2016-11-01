Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E71B3E00CC7; Tue,  1 Nov 2016 02:26:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5FE3E00C9B
	for <meta-ti@yoctoproject.org>; Tue,  1 Nov 2016 02:26:30 -0700 (PDT)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4995A68A01C; Tue,  1 Nov 2016 09:26:30 +0000 (GMT)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id E3AD068A019;
	Tue,  1 Nov 2016 09:26:29 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 4D3BA674025C;
	Tue,  1 Nov 2016 10:26:29 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: meta-ti@yoctoproject.org
Message-ID: <93200aad-94d3-4c69-eff3-4fdaea71fede@mlbassoc.com>
Date: Tue, 1 Nov 2016 10:26:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
Subject: pru-icss: Fix incorect pinout
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
X-List-Received-Date: Tue, 01 Nov 2016 09:26:35 -0000
X-Groupsio-MsgNum: 9212
Content-Type: multipart/mixed; boundary="------------37694DEC1AEA6630E4F38E44"

--------------37694DEC1AEA6630E4F38E44
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I found an incorrect pin assignment for the BeagleBoneBlack
PRU CAPE, which also caused a pin conflict with I2C2.

This patch fixes the error.  Since this is a GIT based recipe,
do you want a patch for the recipe or just to merge it into
your GIT tree?

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


--------------37694DEC1AEA6630E4F38E44
Content-Type: text/x-patch;
 name="fix-incorrect-pin-boneblack.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fix-incorrect-pin-boneblack.patch"

The device tree for the BeagleBoneBlack is using the incorrect pin for
PRU0_UART_rts.  It should be pin P9.21, not P9.19.  This also corrects
a potential pin conflict with I2C2.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
--
Index: git/pru_cape/am335x-boneblack-prucape.dtsi
===================================================================
--- git.orig/pru_cape/am335x-boneblack-prucape.dtsi
+++ git/pru_cape/am335x-boneblack-prucape.dtsi
@@ -23,7 +23,7 @@
 			0x0a8 0x05	/* lcd_data2, OMAP_MUX_MODE5 | AM33XX_PIN_OUTPUT, PRU CAPE Audio Sync, HDMI Conf. */
 			0x184 0x05	/* uart1_txd, OMAP_MUX_MODE5 | AM33XX_PIN_OUTPUT, PRU CAPE PRU UART txd */
 			0x180 0x2d	/* uart1_rxd, OMAP_MUX_MODE5 | AM33XX_PIN_INPUT, PRU CAPE PRU UART rxd */
-			0x17c 0x04	/* spi0_d0, OMAP_MUX_MODE4 | AM33XX_PIN_OUTPUT, PRU CAPE PRU UART rts */
+			0x154 0x04	/* spi0_d0, OMAP_MUX_MODE4 | AM33XX_PIN_OUTPUT, PRU CAPE PRU UART rts */
 			0x150 0x2c	/* spi0_sclk, OMAP_MUX_MODE4 | AM33XX_PIN_INPUT, PRU CAPE PRU UART cts */
 			0x0b8 0x04	/* lcd_data6, OMAP_MUX_MODE4 | AM33XX_PIN_OUTPUT, PRU CAPE LCD rs t3 */
 			0x0e8 0x04	/* lcd_pclk, OMAP_MUX_MODE4 | AM33XX_PIN_OUTPUT, PRU CAPE LCD e v5 */


--------------37694DEC1AEA6630E4F38E44--
