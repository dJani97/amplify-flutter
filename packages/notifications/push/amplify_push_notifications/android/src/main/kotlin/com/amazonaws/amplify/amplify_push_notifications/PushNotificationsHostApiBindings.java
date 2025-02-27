// 
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0
// Autogenerated from Pigeon (v9.2.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.amazonaws.amplify.amplify_push_notifications;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression", "serial"})
public class PushNotificationsHostApiBindings {

  /** Error class for passing custom error details to Flutter via a thrown PlatformException. */
  public static class FlutterError extends RuntimeException {

    /** The error code. */
    public final String code;

    /** The error details. Must be a datatype supported by the api codec. */
    public final Object details;

    public FlutterError(@NonNull String code, @Nullable String message, @Nullable Object details) 
    {
      super(message);
      this.code = code;
      this.details = details;
    }
  }

  @NonNull
  protected static ArrayList<Object> wrapError(@NonNull Throwable exception) {
    ArrayList<Object> errorList = new ArrayList<Object>(3);
    if (exception instanceof FlutterError) {
      FlutterError error = (FlutterError) exception;
      errorList.add(error.code);
      errorList.add(error.getMessage());
      errorList.add(error.details);
    } else {
      errorList.add(exception.toString());
      errorList.add(exception.getClass().getSimpleName());
      errorList.add(
        "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    }
    return errorList;
  }

  public enum PermissionStatus {
    SHOULD_REQUEST(0),
    SHOULD_EXPLAIN_THEN_REQUEST(1),
    GRANTED(2),
    DENIED(3);

    final int index;

    private PermissionStatus(final int index) {
      this.index = index;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class PermissionsOptions {
    private @NonNull Boolean alert;

    public @NonNull Boolean getAlert() {
      return alert;
    }

    public void setAlert(@NonNull Boolean setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"alert\" is null.");
      }
      this.alert = setterArg;
    }

    private @NonNull Boolean sound;

    public @NonNull Boolean getSound() {
      return sound;
    }

    public void setSound(@NonNull Boolean setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"sound\" is null.");
      }
      this.sound = setterArg;
    }

    private @NonNull Boolean badge;

    public @NonNull Boolean getBadge() {
      return badge;
    }

    public void setBadge(@NonNull Boolean setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"badge\" is null.");
      }
      this.badge = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    PermissionsOptions() {}

    public static final class Builder {

      private @Nullable Boolean alert;

      public @NonNull Builder setAlert(@NonNull Boolean setterArg) {
        this.alert = setterArg;
        return this;
      }

      private @Nullable Boolean sound;

      public @NonNull Builder setSound(@NonNull Boolean setterArg) {
        this.sound = setterArg;
        return this;
      }

      private @Nullable Boolean badge;

      public @NonNull Builder setBadge(@NonNull Boolean setterArg) {
        this.badge = setterArg;
        return this;
      }

      public @NonNull PermissionsOptions build() {
        PermissionsOptions pigeonReturn = new PermissionsOptions();
        pigeonReturn.setAlert(alert);
        pigeonReturn.setSound(sound);
        pigeonReturn.setBadge(badge);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(3);
      toListResult.add(alert);
      toListResult.add(sound);
      toListResult.add(badge);
      return toListResult;
    }

    static @NonNull PermissionsOptions fromList(@NonNull ArrayList<Object> list) {
      PermissionsOptions pigeonResult = new PermissionsOptions();
      Object alert = list.get(0);
      pigeonResult.setAlert((Boolean) alert);
      Object sound = list.get(1);
      pigeonResult.setSound((Boolean) sound);
      Object badge = list.get(2);
      pigeonResult.setBadge((Boolean) badge);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class GetPermissionStatusResult {
    private @NonNull PermissionStatus status;

    public @NonNull PermissionStatus getStatus() {
      return status;
    }

    public void setStatus(@NonNull PermissionStatus setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"status\" is null.");
      }
      this.status = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    GetPermissionStatusResult() {}

    public static final class Builder {

      private @Nullable PermissionStatus status;

      public @NonNull Builder setStatus(@NonNull PermissionStatus setterArg) {
        this.status = setterArg;
        return this;
      }

      public @NonNull GetPermissionStatusResult build() {
        GetPermissionStatusResult pigeonReturn = new GetPermissionStatusResult();
        pigeonReturn.setStatus(status);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(1);
      toListResult.add(status == null ? null : status.index);
      return toListResult;
    }

    static @NonNull GetPermissionStatusResult fromList(@NonNull ArrayList<Object> list) {
      GetPermissionStatusResult pigeonResult = new GetPermissionStatusResult();
      Object status = list.get(0);
      pigeonResult.setStatus(status == null ? null : PermissionStatus.values()[(int) status]);
      return pigeonResult;
    }
  }

  public interface Result<T> {
    @SuppressWarnings("UnknownNullness")
    void success(T result);

    void error(@NonNull Throwable error);
  }

  private static class PushNotificationsFlutterApiCodec extends StandardMessageCodec {
    public static final PushNotificationsFlutterApiCodec INSTANCE = new PushNotificationsFlutterApiCodec();

    private PushNotificationsFlutterApiCodec() {}

    @Override
    protected Object readValueOfType(byte type, @NonNull ByteBuffer buffer) {
      switch (type) {
        case (byte) 128:
          return GetPermissionStatusResult.fromList((ArrayList<Object>) readValue(buffer));
        case (byte) 129:
          return PermissionsOptions.fromList((ArrayList<Object>) readValue(buffer));
        default:
          return super.readValueOfType(type, buffer);
      }
    }

    @Override
    protected void writeValue(@NonNull ByteArrayOutputStream stream, Object value) {
      if (value instanceof GetPermissionStatusResult) {
        stream.write(128);
        writeValue(stream, ((GetPermissionStatusResult) value).toList());
      } else if (value instanceof PermissionsOptions) {
        stream.write(129);
        writeValue(stream, ((PermissionsOptions) value).toList());
      } else {
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated class from Pigeon that represents Flutter messages that can be called from Java. */
  public static class PushNotificationsFlutterApi {
    private final @NonNull BinaryMessenger binaryMessenger;

    public PushNotificationsFlutterApi(@NonNull BinaryMessenger argBinaryMessenger) {
      this.binaryMessenger = argBinaryMessenger;
    }

    /** Public interface for sending reply. */ 
    @SuppressWarnings("UnknownNullness")
    public interface Reply<T> {
      void reply(T reply);
    }
    /** The codec used by PushNotificationsFlutterApi. */
    static @NonNull MessageCodec<Object> getCodec() {
      return PushNotificationsFlutterApiCodec.INSTANCE;
    }
    public void onNotificationReceivedInBackground(@NonNull Map<Object, Object> withPayloadArg, @NonNull Reply<Void> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(
              binaryMessenger, "dev.flutter.pigeon.PushNotificationsFlutterApi.onNotificationReceivedInBackground", getCodec());
      channel.send(
          new ArrayList<Object>(Collections.singletonList(withPayloadArg)),
          channelReply -> callback.reply(null));
    }
    public void nullifyLaunchNotification(@NonNull Reply<Void> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(
              binaryMessenger, "dev.flutter.pigeon.PushNotificationsFlutterApi.nullifyLaunchNotification", getCodec());
      channel.send(
          null,
          channelReply -> callback.reply(null));
    }
  }

  private static class PushNotificationsHostApiCodec extends StandardMessageCodec {
    public static final PushNotificationsHostApiCodec INSTANCE = new PushNotificationsHostApiCodec();

    private PushNotificationsHostApiCodec() {}

    @Override
    protected Object readValueOfType(byte type, @NonNull ByteBuffer buffer) {
      switch (type) {
        case (byte) 128:
          return GetPermissionStatusResult.fromList((ArrayList<Object>) readValue(buffer));
        case (byte) 129:
          return PermissionsOptions.fromList((ArrayList<Object>) readValue(buffer));
        default:
          return super.readValueOfType(type, buffer);
      }
    }

    @Override
    protected void writeValue(@NonNull ByteArrayOutputStream stream, Object value) {
      if (value instanceof GetPermissionStatusResult) {
        stream.write(128);
        writeValue(stream, ((GetPermissionStatusResult) value).toList());
      } else if (value instanceof PermissionsOptions) {
        stream.write(129);
        writeValue(stream, ((PermissionsOptions) value).toList());
      } else {
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter. */
  public interface PushNotificationsHostApi {

    void getPermissionStatus(@NonNull Result<GetPermissionStatusResult> result);

    void requestPermissions(@NonNull PermissionsOptions withPermissionOptions, @NonNull Result<Boolean> result);

    @Nullable 
    Map<Object, Object> getLaunchNotification();

    @NonNull 
    Long getBadgeCount();

    void setBadgeCount(@NonNull Long withBadgeCount);

    void registerCallbackFunction(@NonNull Long callbackHandle);

    /** The codec used by PushNotificationsHostApi. */
    static @NonNull MessageCodec<Object> getCodec() {
      return PushNotificationsHostApiCodec.INSTANCE;
    }
    /**Sets up an instance of `PushNotificationsHostApi` to handle messages through the `binaryMessenger`. */
    static void setup(@NonNull BinaryMessenger binaryMessenger, @Nullable PushNotificationsHostApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.PushNotificationsHostApi.getPermissionStatus", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                Result<GetPermissionStatusResult> resultCallback =
                    new Result<GetPermissionStatusResult>() {
                      public void success(GetPermissionStatusResult result) {
                        wrapped.add(0, result);
                        reply.reply(wrapped);
                      }

                      public void error(Throwable error) {
                        ArrayList<Object> wrappedError = wrapError(error);
                        reply.reply(wrappedError);
                      }
                    };

                api.getPermissionStatus(resultCallback);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.PushNotificationsHostApi.requestPermissions", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                PermissionsOptions withPermissionOptionsArg = (PermissionsOptions) args.get(0);
                Result<Boolean> resultCallback =
                    new Result<Boolean>() {
                      public void success(Boolean result) {
                        wrapped.add(0, result);
                        reply.reply(wrapped);
                      }

                      public void error(Throwable error) {
                        ArrayList<Object> wrappedError = wrapError(error);
                        reply.reply(wrappedError);
                      }
                    };

                api.requestPermissions(withPermissionOptionsArg, resultCallback);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.PushNotificationsHostApi.getLaunchNotification", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                try {
                  Map<Object, Object> output = api.getLaunchNotification();
                  wrapped.add(0, output);
                }
 catch (Throwable exception) {
                  ArrayList<Object> wrappedError = wrapError(exception);
                  wrapped = wrappedError;
                }
                reply.reply(wrapped);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.PushNotificationsHostApi.getBadgeCount", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                try {
                  Long output = api.getBadgeCount();
                  wrapped.add(0, output);
                }
 catch (Throwable exception) {
                  ArrayList<Object> wrappedError = wrapError(exception);
                  wrapped = wrappedError;
                }
                reply.reply(wrapped);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.PushNotificationsHostApi.setBadgeCount", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                Number withBadgeCountArg = (Number) args.get(0);
                try {
                  api.setBadgeCount((withBadgeCountArg == null) ? null : withBadgeCountArg.longValue());
                  wrapped.add(0, null);
                }
 catch (Throwable exception) {
                  ArrayList<Object> wrappedError = wrapError(exception);
                  wrapped = wrappedError;
                }
                reply.reply(wrapped);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.PushNotificationsHostApi.registerCallbackFunction", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                Number callbackHandleArg = (Number) args.get(0);
                try {
                  api.registerCallbackFunction((callbackHandleArg == null) ? null : callbackHandleArg.longValue());
                  wrapped.add(0, null);
                }
 catch (Throwable exception) {
                  ArrayList<Object> wrappedError = wrapError(exception);
                  wrapped = wrappedError;
                }
                reply.reply(wrapped);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
}
