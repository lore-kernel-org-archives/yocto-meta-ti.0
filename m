Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4A22E00747
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 23:06:37 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id b45so1671823eek.35
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 23:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=JucETZwY7MFbDCyH9oTouN3FbfR6Vyz4plmwLKrYr44=;
	b=Fr1DmYAgZpFKRjWsAjqeHJp6J3Dd3ktNZs+xkgQT6zMOJr/wolybSR7owOay39tbSt
	pTmpi0kVcLfnUen1oy5XZ+90apWMl7z9SKTENPikkWYBDgIHloRXcOQoGcWGqgW8xjnd
	Ex2EKiijQhnMKAGw2qGKxYBIEdDsPYbSr4x+2i+0yYV4ZGqC286BWodCPrBVv9sZS6LH
	Y6VBzakLfiqCKxmv3c7JQ+pPXY4NkYxI5WwLvsqnAHhHxrEbdQ1nuHtVWu/n5Aw+mChD
	8VqGe2uGYSHmAr19xVXGx6BnxaRpkCK8SlvtksHKg15rbSVfTlwZF0QA0IFoIPgWJuLC
	iocw==
Received: by 10.14.127.78 with SMTP id c54mr4204011eei.8.1337666797165;
	Mon, 21 May 2012 23:06:37 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id u7sm93470615eeb.7.2012.05.21.23.06.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 23:06:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue, 22 May 2012 08:06:26 +0200
Message-Id: <1337666786-29921-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1337666786-29921-1-git-send-email-koen@dominion.thruhere.net>
References: <1337666786-29921-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlFGpd4WImlRA3zEuNWp//0/bTadVwCF/eq/PO6AbfUU24ooQyiiIyZeD6kcbDX6oAk27H3
Cc: denys@ti.com
Subject: [PATCH v2 3/3] linux-ti33x-psp 3.2: merge in 6 musb patches from PSP
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
X-List-Received-Date: Tue, 22 May 2012 06:06:38 -0000

Updating the SRCREV would require redoing all boardfile patches due to the EVM-SK changes. So cherry-pick the 6 patches we need.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...pi41-revisit-the-teardown-path-to-fix-iso.patch |  103 ++++++++++++++++++++
 ...musb-fix-bug-in-data-toggle-sw-workaround.patch |   31 ++++++
 ...udc-core-stop-UDC-on-device-initiated-dis.patch |   41 ++++++++
 ...udc-core-fix-asymmetric-calls-in-remove_d.patch |   43 ++++++++
 ...-usb-gadget-udc-core-fix-wrong-call-order.patch |   33 +++++++
 ...udc-core-fix-incompatibility-with-dummy-h.patch |   46 +++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    8 +-
 7 files changed, 304 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0001-usb-musb-cppi41-revisit-the-teardown-path-to-fix-iso.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0002-usb-musb-fix-bug-in-data-toggle-sw-workaround.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0003-usb-gadget-udc-core-stop-UDC-on-device-initiated-dis.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0004-usb-gadget-udc-core-fix-asymmetric-calls-in-remove_d.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0005-usb-gadget-udc-core-fix-wrong-call-order.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0006-usb-gadget-udc-core-fix-incompatibility-with-dummy-h.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0001-usb-musb-cppi41-revisit-the-teardown-path-to-fix-iso.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0001-usb-musb-cppi41-revisit-the-teardown-path-to-fix-iso.patch
new file mode 100644
index 0000000..dd2e19a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0001-usb-musb-cppi41-revisit-the-teardown-path-to-fix-iso.patch
@@ -0,0 +1,103 @@
+From c2746810dc7bcaaae2dec493c501eb7213d14858 Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Tue, 8 May 2012 12:05:47 +0530
+Subject: [PATCH 1/6] usb: musb: cppi41: revisit the teardown path to fix isoc
+ issue
+
+Fixes the camera streaming issue when application is stopped and restarted multiple times.
+Changes:
+	- Disable DMAReq of TX/RX endpoints before teardown
+	- FIFO flush only when RxPktRdy is set
+	- Clear ReqPkt if in host mode.
+---
+ drivers/usb/musb/cppi41_dma.c |   42 ++++++++++++++++++++++++----------------
+ drivers/usb/musb/musb_host.c  |    2 +-
+ 2 files changed, 26 insertions(+), 18 deletions(-)
+
+diff --git a/drivers/usb/musb/cppi41_dma.c b/drivers/usb/musb/cppi41_dma.c
+index e4d3173..4761acd 100644
+--- a/drivers/usb/musb/cppi41_dma.c
++++ b/drivers/usb/musb/cppi41_dma.c
+@@ -1206,6 +1206,11 @@ static int cppi41_channel_abort(struct dma_channel *channel)
+ 	if (cppi_ch->transmit) {
+ 		dprintk("Tx channel teardown, cppi_ch = %p\n", cppi_ch);
+ 
++		/* disable the DMAreq before teardown */
++		csr  = musb_readw(epio, MUSB_TXCSR);
++		csr &= ~MUSB_TXCSR_DMAENAB;
++		musb_writew(epio, MUSB_TXCSR, csr);
++
+ 		/* Tear down Tx DMA channel */
+ 		usb_tx_ch_teardown(cppi_ch);
+ 
+@@ -1223,11 +1228,30 @@ static int cppi41_channel_abort(struct dma_channel *channel)
+ 	} else { /* Rx */
+ 		dprintk("Rx channel teardown, cppi_ch = %p\n", cppi_ch);
+ 
++		/* disable the DMAreq and remove reqpkt */
++		csr  = musb_readw(epio, MUSB_RXCSR);
++		dev_dbg(musb->controller,
++			"before rx-teardown: rxcsr %x rxcount %x\n", csr,
++			musb_readw(epio, MUSB_RXCOUNT));
++
++		/* For host, clear (just) ReqPkt at end of current packet(s) */
++		if (is_host_active(cppi->musb))
++			csr &= ~MUSB_RXCSR_H_REQPKT;
++
++		csr &= ~MUSB_RXCSR_DMAENAB;
++		musb_writew(epio, MUSB_RXCSR, csr);
++
++
+ 		/* Flush FIFO of the endpoint */
+ 		csr  = musb_readw(epio, MUSB_RXCSR);
+-		csr |= MUSB_RXCSR_FLUSHFIFO | MUSB_RXCSR_H_WZC_BITS;
++
++		if (csr & MUSB_RXCSR_RXPKTRDY)
++			csr |= MUSB_RXCSR_FLUSHFIFO;
++
++		csr |= MUSB_RXCSR_H_WZC_BITS;
+ 		musb_writew(epio, MUSB_RXCSR, csr);
+ 		musb_writew(epio, MUSB_RXCSR, csr);
++		csr  = musb_readw(epio, MUSB_RXCSR);
+ 
+ 		/* Issue CPPI FIFO teardown for Rx channel */
+ 		td_reg  = musb_readl(reg_base, cppi->teardown_reg_offs);
+@@ -1246,22 +1270,6 @@ static int cppi41_channel_abort(struct dma_channel *channel)
+ 
+ 		/* For host, ensure ReqPkt is never set again */
+ 		cppi41_autoreq_update(cppi_ch, USB_NO_AUTOREQ);
+-
+-		/* For host, clear (just) ReqPkt at end of current packet(s) */
+-		if (is_host_active(cppi->musb))
+-			csr &= ~MUSB_RXCSR_H_REQPKT;
+-		csr |= MUSB_RXCSR_H_WZC_BITS;
+-
+-		/* Clear DMA enable */
+-		csr &= ~MUSB_RXCSR_DMAENAB;
+-		musb_writew(epio, MUSB_RXCSR, csr);
+-
+-		/* Flush the FIFO of endpoint once again */
+-		csr  = musb_readw(epio, MUSB_RXCSR);
+-		csr |= MUSB_RXCSR_FLUSHFIFO | MUSB_RXCSR_H_WZC_BITS;
+-		musb_writew(epio, MUSB_RXCSR, csr);
+-
+-		udelay(50);
+ 	}
+ 
+ 	/*
+diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
+index d805d1b..2195633 100644
+--- a/drivers/usb/musb/musb_host.c
++++ b/drivers/usb/musb/musb_host.c
+@@ -2224,7 +2224,7 @@ static int musb_cleanup_urb(struct urb *urb, struct musb_qh *qh)
+ 	}
+ 
+ 	/* turn off DMA requests, discard state, stop polling ... */
+-	if (is_in) {
++	if (is_in && ep->epnum) {
+ 		/* giveback saves bulk toggle */
+ 		csr = musb_h_flush_rxfifo(ep, 0);
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0002-usb-musb-fix-bug-in-data-toggle-sw-workaround.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0002-usb-musb-fix-bug-in-data-toggle-sw-workaround.patch
new file mode 100644
index 0000000..dab230c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0002-usb-musb-fix-bug-in-data-toggle-sw-workaround.patch
@@ -0,0 +1,31 @@
+From a9e9e758646ee41289c0030645bbdd43c711e9c1 Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Fri, 18 May 2012 14:51:15 +0530
+Subject: [PATCH 2/6] usb: musb: fix bug in data toggle sw workaround
+
+Data toggle software workaround for extra IN issue introduced a bug for PIO mode
+as data toggle is getting updated even for PIO mode which should not be done.
+
+Merge to:
+usb: musb: cppi41: correct data toggle mismatch to fix extra IN token issue
+---
+ drivers/usb/musb/musb_host.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
+index 2195633..80d83bd 100644
+--- a/drivers/usb/musb/musb_host.c
++++ b/drivers/usb/musb/musb_host.c
+@@ -359,7 +359,8 @@ static inline void musb_save_toggle(struct musb_qh *qh, int is_in,
+ 		curr_toggle = csr ? 1 : 0;
+ 
+ 		/* check if data toggle has gone out of sync */
+-		if (curr_toggle == qh->hw_ep->prev_toggle) {
++		if (is_dma_capable() && qh->hw_ep->rx_channel &&
++				curr_toggle == qh->hw_ep->prev_toggle) {
+ 			dev_dbg(musb->controller,
+ 				"Data toggle same as previous (=%d) on ep%d\n",
+ 					curr_toggle, qh->hw_ep->epnum);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0003-usb-gadget-udc-core-stop-UDC-on-device-initiated-dis.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0003-usb-gadget-udc-core-stop-UDC-on-device-initiated-dis.patch
new file mode 100644
index 0000000..88a1fb9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0003-usb-gadget-udc-core-stop-UDC-on-device-initiated-dis.patch
@@ -0,0 +1,41 @@
+From 2eac6057134bcb77edcdc462b810465850caec23 Mon Sep 17 00:00:00 2001
+From: Felipe Balbi <balbi@ti.com>
+Date: Thu, 15 Mar 2012 16:37:18 +0200
+Subject: [PATCH 3/6] usb: gadget: udc-core: stop UDC on device-initiated
+ disconnect
+
+When we want to do device-initiated disconnect,
+let's make sure we stop the UDC in order to
+e.g. allow lower power states to be achieved by
+turning off unnecessary clocks and/or stoping
+PHYs.
+
+When reconnecting, call ->udc_start() again to
+make sure UDC is reinitialized.
+
+Cc: stable@vger.kernel.org
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+---
+ drivers/usb/gadget/udc-core.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/gadget/udc-core.c b/drivers/usb/gadget/udc-core.c
+index 0b0d12c..475c997 100644
+--- a/drivers/usb/gadget/udc-core.c
++++ b/drivers/usb/gadget/udc-core.c
+@@ -359,8 +359,12 @@ static ssize_t usb_udc_softconn_store(struct device *dev,
+ 	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);
+ 
+ 	if (sysfs_streq(buf, "connect")) {
++		if (udc_is_newstyle(udc))
++			usb_gadget_udc_start(udc->gadget, udc->driver);
+ 		usb_gadget_connect(udc->gadget);
+ 	} else if (sysfs_streq(buf, "disconnect")) {
++		if (udc_is_newstyle(udc))
++			usb_gadget_udc_stop(udc->gadget, udc->driver);
+ 		usb_gadget_disconnect(udc->gadget);
+ 	} else {
+ 		dev_err(dev, "unsupported command '%s'\n", buf);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0004-usb-gadget-udc-core-fix-asymmetric-calls-in-remove_d.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0004-usb-gadget-udc-core-fix-asymmetric-calls-in-remove_d.patch
new file mode 100644
index 0000000..eae1c70
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0004-usb-gadget-udc-core-fix-asymmetric-calls-in-remove_d.patch
@@ -0,0 +1,43 @@
+From fefa8fade565b137ae3d01801196840b6ccfc98f Mon Sep 17 00:00:00 2001
+From: Kishon Vijay Abraham I <kishon@ti.com>
+Date: Wed, 21 Mar 2012 21:34:30 +0530
+Subject: [PATCH 4/6] usb: gadget: udc-core: fix asymmetric calls in
+ remove_driver
+
+During modprobe of gadget driver, pullup is called after
+udc_start. In order to make the exit path symmetric when
+removing a gadget driver, call pullup before ->udc_stop.
+
+This is needed to avoid issues with PM where udc_stop
+disables the module completely (put IP in reset state,
+cut functional and interface clocks, and so on), which
+prevents us from accessing the IP's address space,
+thus creating the possibility of an abort exception
+when we try to access IP's address space after clocks
+are off.
+
+Cc: stable@vger.kernel.org
+Signed-off-by: Partha Basak <p-basak2@ti.com>
+Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+---
+ drivers/usb/gadget/udc-core.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/gadget/udc-core.c b/drivers/usb/gadget/udc-core.c
+index 475c997..ec02ed0 100644
+--- a/drivers/usb/gadget/udc-core.c
++++ b/drivers/usb/gadget/udc-core.c
+@@ -212,8 +212,8 @@ static void usb_gadget_remove_driver(struct usb_udc *udc)
+ 	if (udc_is_newstyle(udc)) {
+ 		udc->driver->disconnect(udc->gadget);
+ 		udc->driver->unbind(udc->gadget);
+-		usb_gadget_udc_stop(udc->gadget, udc->driver);
+ 		usb_gadget_disconnect(udc->gadget);
++		usb_gadget_udc_stop(udc->gadget, udc->driver);
+ 	} else {
+ 		usb_gadget_stop(udc->gadget, udc->driver);
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0005-usb-gadget-udc-core-fix-wrong-call-order.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0005-usb-gadget-udc-core-fix-wrong-call-order.patch
new file mode 100644
index 0000000..ae705cf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0005-usb-gadget-udc-core-fix-wrong-call-order.patch
@@ -0,0 +1,33 @@
+From 7a0dcaac06bfffd4df4bf7a006c601b31acc7cb7 Mon Sep 17 00:00:00 2001
+From: Felipe Balbi <balbi@ti.com>
+Date: Fri, 27 Apr 2012 11:02:15 +0300
+Subject: [PATCH 5/6] usb: gadget: udc-core: fix wrong call order
+
+commit 6d258a4 (usb: gadget: udc-core: stop UDC on device-initiated
+disconnect) introduced another case of asymmetric calls when issuing
+a device-initiated disconnect. Fix it.
+
+Reported-by: Ben Hutchings <ben@decadent.org.uk>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+---
+ drivers/usb/gadget/udc-core.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/gadget/udc-core.c b/drivers/usb/gadget/udc-core.c
+index ec02ed0..3ea783d 100644
+--- a/drivers/usb/gadget/udc-core.c
++++ b/drivers/usb/gadget/udc-core.c
+@@ -363,9 +363,9 @@ static ssize_t usb_udc_softconn_store(struct device *dev,
+ 			usb_gadget_udc_start(udc->gadget, udc->driver);
+ 		usb_gadget_connect(udc->gadget);
+ 	} else if (sysfs_streq(buf, "disconnect")) {
++		usb_gadget_disconnect(udc->gadget);
+ 		if (udc_is_newstyle(udc))
+ 			usb_gadget_udc_stop(udc->gadget, udc->driver);
+-		usb_gadget_disconnect(udc->gadget);
+ 	} else {
+ 		dev_err(dev, "unsupported command '%s'\n", buf);
+ 		return -EINVAL;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0006-usb-gadget-udc-core-fix-incompatibility-with-dummy-h.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0006-usb-gadget-udc-core-fix-incompatibility-with-dummy-h.patch
new file mode 100644
index 0000000..70f9398
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/usb/0006-usb-gadget-udc-core-fix-incompatibility-with-dummy-h.patch
@@ -0,0 +1,46 @@
+From 91cdc6fbc271e01e231dcf0e9403448aa19433fb Mon Sep 17 00:00:00 2001
+From: Alan Stern <stern@rowland.harvard.edu>
+Date: Thu, 26 Apr 2012 11:31:57 -0400
+Subject: [PATCH 6/6] usb: gadget: udc-core: fix incompatibility with
+ dummy-hcd
+
+This patch (as1548) fixes a recently-introduced incompatibility
+between the UDC core and the dummy-hcd driver.  Commit
+8ae8090c82eb407267001f75b3d256b3bd4ae691 (usb: gadget: udc-core: fix
+asymmetric calls in remove_driver) moved the usb_gadget_udc_stop()
+call in usb_gadget_remove_driver() below the usb_gadget_disconnect()
+call.
+
+As a result, usb_gadget_disconnect() gets called at a time when the
+gadget driver believes it has been unbound but dummy-hcd believes
+it has not.  A nasty error ensues when dummy-hcd calls the gadget
+driver's disconnect method a second time.
+
+To fix the problem, this patch moves the gadget driver's unbind
+notification after the usb_gadget_disconnect() call.  Now nothing
+happens between the two unbind notifications, so nothing goes wrong.
+
+Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
+Tested-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+---
+ drivers/usb/gadget/udc-core.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/gadget/udc-core.c b/drivers/usb/gadget/udc-core.c
+index 3ea783d..4e2e13e 100644
+--- a/drivers/usb/gadget/udc-core.c
++++ b/drivers/usb/gadget/udc-core.c
+@@ -211,8 +211,8 @@ static void usb_gadget_remove_driver(struct usb_udc *udc)
+ 
+ 	if (udc_is_newstyle(udc)) {
+ 		udc->driver->disconnect(udc->gadget);
+-		udc->driver->unbind(udc->gadget);
+ 		usb_gadget_disconnect(udc->gadget);
++		udc->driver->unbind(udc->gadget);
+ 		usb_gadget_udc_stop(udc->gadget, udc->driver);
+ 	} else {
+ 		usb_gadget_stop(udc->gadget, udc->driver);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 888c7a3..82fa5eb 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "m+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "n+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -29,6 +29,12 @@ do_compile_prepend() {
 }
 
 PATCHES_OVER_PSP = " \
+	file://usb/0001-usb-musb-cppi41-revisit-the-teardown-path-to-fix-iso.patch \
+	file://usb/0002-usb-musb-fix-bug-in-data-toggle-sw-workaround.patch \
+	file://usb/0003-usb-gadget-udc-core-stop-UDC-on-device-initiated-dis.patch \
+	file://usb/0004-usb-gadget-udc-core-fix-asymmetric-calls-in-remove_d.patch \
+	file://usb/0005-usb-gadget-udc-core-fix-wrong-call-order.patch \
+	file://usb/0006-usb-gadget-udc-core-fix-incompatibility-with-dummy-h.patch \
 	file://3.2.1/0001-MAINTAINERS-stable-Update-address.patch \
 	file://3.2.1/0002-Documentation-Update-stable-address.patch \
 	file://3.2.1/0003-firmware-Fix-an-oops-on-reading-fw_priv-fw-in-sysfs-.patch \
-- 
1.7.10


