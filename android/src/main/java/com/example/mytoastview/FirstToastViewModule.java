package com.example.mytoastview;

import android.content.Context;
import android.widget.Toast;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

/**
 * Created by ns on 2018/6/21.
 */

public class FirstToastViewModule extends ReactContextBaseJavaModule {

    private Context context;

    public FirstToastViewModule(ReactApplicationContext reactContext) {
        super(reactContext);
        context = reactContext;
    }

    @Override
    public String getName() {
        return "AppAlert";
    }

    @ReactMethod
    public void showToast() {
        Toast.makeText(context,"yjh牛逼",Toast.LENGTH_SHORT).show();
    }
}
