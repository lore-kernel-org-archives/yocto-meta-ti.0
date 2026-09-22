Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A3CC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:55:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3588.1790103357874351781
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B538440CD3;
	Tue, 22 Sep 2026 18:55:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_ll0HO98TCd; Tue, 22 Sep 2026 18:55:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E559240C3A;
	Tue, 22 Sep 2026 18:55:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 928AF17E96B; Tue, 22 Sep 2026 14:55:43 -0400 (EDT)
Date: Tue, 22 Sep 2026 14:55:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Paresh Bhagat <p-bhagat@ti.com>, meta-ti@lists.yoctoproject.org,
	praneeth@ti.com, v-singh1@ti.com, afd@ti.com, j-sahu@ti.com,
	p-gupta5@ti.com, r-soni@ti.com, s-kapoor@ti.com, s-sinha@ti.com,
	sen@ti.com, y-hegde@ti.com
Subject: Re: [master/wrynose][PATCH] recipes-multimedia: Add PipeWire
 bbappend for config files
Message-ID: <20260922185543.GB4190@denix.org>
References: <20260922103002.3723697-1-p-bhagat@ti.com>
 <cd12b7db-e3aa-49bd-bf16-465002cc0a85@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd12b7db-e3aa-49bd-bf16-465002cc0a85@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:55:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20396

On Tue, Sep 22, 2026 at 01:44:16PM -0500, Ryan Eatmon wrote:
> 
> With this patch in here we will need to add a layer dependency
> between meta-ti-extras and meta-openembedded.  In
> meta-ti/meta-ti-extras/conf/layer.conf you need to add a second
> patch that make this change:
> 
> LAYERDEPENDS_meta-ti-extras = " \
>     meta-ti-bsp \
>     openembedded-layer \

It's rather multimedia-layer, not openembedded-layer...


> "
> 
> Otherwise we will get errors when running the check layer script and
> running afoul of the Yocto Project Compatible requirement.  That's
> what the error in the PRC response is telling us.
> 
> Can you send a v2 with a second patch that does this?  Make that
> patch the first patch in the series with this one the second.

More generic question - do we want this to be a hard LAYERDEPENDS, or a soft 
LAYERRECOMMENDS with a dynamic layer setup?


> On 9/22/2026 5:30 AM, Paresh Bhagat wrote:
> >Extend the PipeWire recipe to add platform-specific ALSA configuration.
> >Add sink and source configuration for 8-channel audio playback and
> >capture on the AM62D2EVM as the default configuration is 2-channel.
> >
> >Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >---
> >  .../pipewire/pipewire-ti.inc                  | 20 +++++++++++++++++++
> >  .../am62dxx-evm/90-pipewire-sink.conf         | 17 ++++++++++++++++
> >  .../am62dxx-evm/91-pipewire-source.conf       | 17 ++++++++++++++++
> >  .../pipewire/pipewire_%.bbappend              |  4 ++++
> >  4 files changed, 58 insertions(+)
> >  create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
> >  create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> >  create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> >  create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
> >
> >diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc b/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
> >new file mode 100644
> >index 00000000..65a82671
> >--- /dev/null
> >+++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
> >@@ -0,0 +1,20 @@
> >+PR:append = ".ti0"
> >+
> >+FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
> >+
> >+# AM62D-specific config files
> >+SRC_URI:append:am62dxx-evm = " \
> >+    file://90-pipewire-sink.conf \
> >+    file://91-pipewire-source.conf \
> >+"
> >+
> >+do_install:append:am62dxx-evm() {
> >+    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> >+    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> >+    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> >+}
> >+
> >+FILES:${PN}:append:am62dxx-evm = " \
> >+    ${sysconfdir}/pipewire/pipewire.conf.d/90-pipewire-sink.conf \
> >+    ${sysconfdir}/pipewire/pipewire.conf.d/91-pipewire-source.conf \
> >+"
> >diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> >new file mode 100644
> >index 00000000..857c344e
> >--- /dev/null
> >+++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> >@@ -0,0 +1,17 @@
> >+# PipeWire sink configuration for AM62D.
> >+
> >+context.objects = [
> >+    {
> >+        factory = adapter
> >+        args = {
> >+            factory.name           = api.alsa.pcm.sink
> >+            node.name              = "alsa_audio_sink"
> >+            node.description       = "Audio Output"
> >+            media.class            = "Audio/Sink"
> >+            api.alsa.path          = "hw:AM62D2EVM,0"
> >+            audio.rate             = 48000
> >+            audio.channels         = 8
> >+            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> >+        }
> >+    }
> >+]
> >diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> >new file mode 100644
> >index 00000000..ac7635de
> >--- /dev/null
> >+++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> >@@ -0,0 +1,17 @@
> >+# PipeWire source configuration for AM62D.
> >+
> >+context.objects = [
> >+    {
> >+        factory = adapter
> >+        args = {
> >+            factory.name           = api.alsa.pcm.source
> >+            node.name              = "alsa_audio_source"
> >+            node.description       = "Audio Input"
> >+            media.class            = "Audio/Source"
> >+            api.alsa.path          = "hw:AM62D2EVM,0"
> >+            audio.rate             = 48000
> >+            audio.channels         = 8
> >+            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> >+        }
> >+    }
> >+]
> >diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
> >new file mode 100644
> >index 00000000..f806d28f
> >--- /dev/null
> >+++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
> >@@ -0,0 +1,4 @@
> >+PIPEWIRE_TI = ""
> >+PIPEWIRE_TI:ti-soc = "pipewire-ti.inc"
> >+
> >+require ${PIPEWIRE_TI}

